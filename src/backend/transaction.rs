use std::cell::Cell;

use gtk::glib::subclass::{object::ObjectImpl, types::ObjectSubclass};

use crate::prelude::*;
use glib::subclass::prelude::*;
use super::{installation::InstallLocation, run_transaction::run_transaction};
pub const TRANSACTION_ACTION_NONE: i32 = 0;
pub const TRANSACTION_ACTION_INSTALL: i32 = 1;
pub const TRANSACTION_ACTION_UPDATE: i32 = 2;
pub const TRANSACTION_ACTION_UNINSTALL: i32 = 3;

// ====== ApphubTransaction GObject ======

#[derive(Default, glib::Properties)]
#[properties(wrapper_type = ApphubTransaction)]
pub struct ApphubTransactionPrivate {
    #[property(get, construct_only)]
    app_id: RefCell<Option<String>>,
    #[property(get, set)]
    progress: Cell<f64>,
    #[property(get, set)]
    error: RefCell<Option<String>>,
    #[property(get,construct_only, type = i32)]
    action: Cell<i32>,
    #[property(get, set)]
    has_error: Cell<bool>,
    #[property(get, construct_only)]
    cancellable: RefCell<Cancellable>,
}

#[glib::object_subclass]
impl ObjectSubclass for ApphubTransactionPrivate {
    const NAME: &'static str = "ApphubTransaction";
    type Type = ApphubTransaction;
}

#[glib::derived_properties]
impl ObjectImpl for ApphubTransactionPrivate {}

glib::wrapper! {
    pub struct ApphubTransaction(ObjectSubclass<ApphubTransactionPrivate>);
}

impl ApphubTransaction {
    pub fn new(app_id: &str, action: i32) -> ApphubTransaction {
        glib::Object::builder()
            .property("app_id", app_id)
            .property("progress", 0.0)
            .property("error", "")
            .property("action", action)
            .property("has_error", false)
            .property("cancellable", Cancellable::new())
            .build()
    }

    pub fn install(&self, install: InstallLocation) -> ApphubTransaction {
        run_transaction(&self.app_id().unwrap(), install, TRANSACTION_ACTION_INSTALL)
    }

    pub fn uninstall(&self, install: InstallLocation) -> ApphubTransaction {
        run_transaction(
            &self.app_id().unwrap(),
            install,
            TRANSACTION_ACTION_UNINSTALL,
        )
    }

    pub fn update(&self, install: InstallLocation) -> ApphubTransaction {
        run_transaction(&self.app_id().unwrap(), install, TRANSACTION_ACTION_UPDATE)
    }
}
