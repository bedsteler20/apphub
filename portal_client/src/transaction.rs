use crate::{InstallLocation, TransactionType};

mod imp {
    use std::cell::{Cell, RefCell};

    use glib::prelude::*;
    use glib::subclass::prelude::*;
    use glib::subclass::types::ObjectSubclass;

    #[derive(Default, glib::Properties)]
    #[properties(wrapper_type = super::ApphubTransaction)]
    pub struct ApphubTransaction {
        #[property(get, set)]
        app_id: RefCell<Option<String>>,
        #[property(get, set)]
        progress: Cell<f64>,
        #[property(get, set)]
        error: RefCell<Option<String>>,
        #[property(get, set)]
        id: Cell<u32>,
        #[property(get, set)]
        done: Cell<bool>,
        #[property(get, set, builder(super::InstallLocation::default()))]
        install_location: Cell<super::InstallLocation>,
        #[property(get, set, builder(super::TransactionType::default()))]
        transaction_type: Cell<super::TransactionType>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubTransaction {
        const NAME: &'static str = "ApphubTransaction";
        type Type = super::ApphubTransaction;
    }

    #[glib::derived_properties]
    impl ObjectImpl for ApphubTransaction {}
}

// ====== Public Interface ======
glib::wrapper! {
    pub struct ApphubTransaction(ObjectSubclass<imp::ApphubTransaction>);
}

impl ApphubTransaction {
    pub fn from_t(transaction: dbus_types::Transaction) -> Self {
        let err = if transaction.error.is_empty() {
            None
        } else {
            Some(transaction.error)
        };
        glib::Object::builder()
            .property("id", transaction.id)
            .property("app-id", transaction.app_id)
            .property("progress", transaction.progress)
            .property("error", err)
            .property(
                "install-location",
                Into::<InstallLocation>::into(transaction.install_location),
            )
            .property(
                "transaction-type",
                Into::<TransactionType>::into(transaction.transaction_type),
            )
            .build()
    }
}
