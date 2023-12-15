use std::{sync::Arc, thread};

use crate::prelude::*;

mod imp {
    use std::{
        cell::{Cell, RefCell},
        future::Future,
    };

    use glib::subclass::{object::ObjectImpl, types::ObjectSubclass};

    use crate::prelude::*;

    #[derive(Debug, Default, glib::Properties)]
    #[properties(wrapper_type = super::ApphubTransaction)]
    pub struct ApphubTransaction {
        #[property(get, set)]
        progress: Cell<f64>,
        #[property(get, set, builder(ApphubTransactionType::Install))]
        transaction_type: Cell<ApphubTransactionType>,
        #[property(get, set, builder(ApphubInstallLocation::System))]
        install_location: Cell<ApphubInstallLocation>,
        #[property(get, construct_only)]
        cancellable: RefCell<Cancellable>,
        #[property(get, set)]
        error: RefCell<Option<String>>,
        #[property(get, set)]
        app_id: RefCell<String>,
        #[property(get, set)]
        app_ref: RefCell<String>,
        #[property(get, set)]
        is_done: Cell<bool>,
        #[property(get, set)]
        remote: RefCell<String>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubTransaction {
        const NAME: &'static str = "ApphubTransaction";
        type Type = super::ApphubTransaction;
    }

    #[glib::derived_properties]
    impl ObjectImpl for ApphubTransaction {}
}

glib::wrapper! {
    pub struct ApphubTransaction(ObjectSubclass<imp::ApphubTransaction>);
}

impl ApphubTransaction {
    pub fn new_install(
        app_id: String,
        location: ApphubInstallLocation,
        remote: String,
        app_ref: String,
    ) -> Self {
        Self::new(
            app_id,
            location,
            remote,
            app_ref,
            ApphubTransactionType::Install,
        )
    }
    pub fn new_update(
        app_id: String,
        location: ApphubInstallLocation,
        remote: String,
        app_ref: String,
    ) -> Self {
        Self::new(
            app_id,
            location,
            remote,
            app_ref,
            ApphubTransactionType::Update,
        )
    }
    pub fn new_uninstall(
        app_id: String,
        location: ApphubInstallLocation,
        remote: String,
        app_ref: String,
    ) -> Self {
        Self::new(
            app_id,
            location,
            remote,
            app_ref,
            ApphubTransactionType::Uninstall,
        )
    }

    fn new(
        app_id: String,
        location: ApphubInstallLocation,
        remote: String,
        app_ref: String,
        transaction_type: ApphubTransactionType,
    ) -> Self {
        glib::Object::builder()
            .property("app-id", app_id)
            .property("install-location", location)
            .property("remote", remote)
            .property("app-ref", app_ref)
            .property("transaction-type", transaction_type)
            .property("progress", 0.0)
            .property("error", None::<String>)
            .property("is-done", false)
            .property("cancellable", Cancellable::new())
            .build()
    }

    pub fn cancel(&self) {
        self.cancellable().cancel();
    }

    pub fn start(&self) {
        let (sender, receiver) = transaction_state_channel();

        let app_ref = self.app_ref().clone();
        let cancellable = self.cancellable().clone();
        let transaction_type = self.transaction_type();
        let install_location = self.install_location();
        let remote = self.remote().clone();

        thread::spawn(move || {
            let transaction = libflatpak::Transaction::for_installation(
                &Into::<libflatpak::Installation>::into(install_location),
                Some(&cancellable),
            );
            if let Err(e) = transaction {
                sender.send(TransactionState::Error(e.into())).unwrap();
                return;
            }
            let transaction = transaction.unwrap();

            let e = match transaction_type {
                ApphubTransactionType::Install => transaction.add_install(&remote, &app_ref, &[]),
                ApphubTransactionType::Update => transaction.add_update(&app_ref, &[], None),
                ApphubTransactionType::Uninstall => transaction.add_uninstall(&app_ref),
            };
            if let Err(e) = e {
                sender.send(TransactionState::Error(e.into())).unwrap();
                return;
            }

            send_transaction_state(&transaction, &sender);

            if let Err(e) = transaction.run(Some(&cancellable)) {
                sender.send(TransactionState::Error(e.into())).unwrap();
            } else {
                sender.send(TransactionState::Done).unwrap();
            }
        });

        let this = self.clone();

        receiver.attach(None, move |state| match state {
            TransactionState::Progress(progress) => {
                this.set_progress(progress);
                glib::ControlFlow::Continue
            }
            TransactionState::Error(e) => {
                this.set_error(e.to_string());
                glib::ControlFlow::Continue
            }
            TransactionState::Done => {
                this.set_is_done(true);
                glib::ControlFlow::Break
            }
        });
    }
}
