use std::cell::{Cell, RefCell};

use adw::subclass::prelude::DerivedObjectProperties;
use gio::prelude::*;
use gio::Cancellable;
use glib::subclass::{object::ObjectImpl, types::ObjectSubclass};

use crate::models::InstallLocation;

mod imp {
    use super::*;

    #[derive(Debug, Default, glib::Properties)]
    #[properties(wrapper_type = super::ApphubTransaction)]
    pub struct ApphubTransaction {
        #[property(get, set)]
        progress: Cell<f64>,
        #[property(get, set, builder(TransactionType::Install))]
        transaction_type: Cell<TransactionType>,
        #[property(get, set, builder(InstallLocation::System))]
        install_location: Cell<InstallLocation>,
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
        #[property(get, set)]
        id: Cell<u32>,
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
    pub fn new(
        app_id: String,
        location: InstallLocation,
        remote: String,
        app_ref: String,
        transaction_type: TransactionType,
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
            .property("id", glib::random_int())
            .build()
    }

    pub fn cancel(&self) {
        self.cancellable().cancel();
    }

    pub fn start(&self) {
        crate::utils::run_transaction(self)
    }
}


#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, glib::Enum)]
#[enum_type(name = "ApphubTransactionType")]
pub enum TransactionType {
    #[default]
    Install,
    Update,
    Uninstall,
}
