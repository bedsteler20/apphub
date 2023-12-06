use glib::prelude::*;
use gtk::glib::{self, Object, Variant, VariantType};
use gtk::subclass::prelude::*;
use gtk::{gio, prelude::*};
mod transaction_type;
#[derive(Debug, Clone)]
pub struct EventBus {
    install_start: gio::SimpleAction,
    install_progress: gio::SimpleAction,
    install_done: gio::SimpleAction,
}

enum TransactionState {
    Start {
        app_id: String,
        // type_: TransactionType,
    },
    Progress {
        app_id: String,
        progress: f64,
        // type_: TransactionType,
    },
    Done {
        app_id: String,
        // type_: TransactionType,
    },
}

impl EventBus {
    pub fn new() -> Self {
        Self {
            install_start: action("install_start", "s"),
            install_progress: action("install_progress", "(sd)"),
            install_done: action("install_done", "s"),
        }
    }

    pub fn emit_install_start(&self, app_id: &str) {
        self.install_start.activate(Some(&(app_id).to_variant()));
    }

    pub fn emit_install_progress(&self, app_id: &str, progress: f64) {
        self.install_progress
            .activate(Some(&(app_id, progress).to_variant()));
    }

    pub fn emit_install_done(&self, app_id: &str) {
        self.install_done.activate(Some(&(app_id).to_variant()));
    }

    pub fn connect_install_start(&self, f: Box<dyn Fn(&str)>) -> glib::SignalHandlerId {
        self.install_start.connect_activate(move |_, args| {
            let app_id = args.unwrap().get::<String>().unwrap();
            f(&app_id);
        })
    }

    pub fn connect_install_progress(&self, f: Box<dyn Fn(&str, f64)>) -> glib::SignalHandlerId {
        self.install_progress.connect_activate(move |_, args| {
            let (app_id, progress) = args.unwrap().get::<(String, f64)>().unwrap();
            f(&app_id, progress);
        })
    }

    pub fn connect_install_done(&self, f: Box<dyn Fn(&str)>) -> glib::SignalHandlerId {
        self.install_done.connect_activate(move |_, args| {
            let app_id = args.unwrap().get::<String>().unwrap();
            f(&app_id);
        })
    }

    pub fn disconnect_install_start(&self, id: glib::SignalHandlerId) {
        self.install_start.disconnect(id);
    }

    pub fn disconnect_install_progress(&self, id: glib::SignalHandlerId) {
        self.install_progress.disconnect(id);
    }

    pub fn disconnect_install_done(&self, id: glib::SignalHandlerId) {
        self.install_done.disconnect(id);
    }
}

fn action(name: &str, ty: &str) -> gio::SimpleAction {
    gio::SimpleAction::new(name, Some(&VariantType::new(ty).unwrap()))
}
