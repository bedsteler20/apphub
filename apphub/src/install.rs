use std::thread;

use flatpak::gio::Cancellable;
use flatpak::prelude::{CancellableExtManual, TransactionExt};
use glib::translate::FromGlib;
use glib::SourceId;

use std::cell::{Cell, RefCell};

use flatpak::{glib, glib::subclass::prelude::*, prelude::*};

const REF_BASE_URL: &str = "https://dl.flathub.org/repo/appstream/";

// ====== Action Enum ======

pub const TRANSACTION_ACTION_NONE: i32 = 0;
pub const TRANSACTION_ACTION_INSTALL: i32 = 1;
pub const TRANSACTION_ACTION_UPDATE: i32 = 2;
pub const TRANSACTION_ACTION_UNINSTALL: i32 = 3;

// ====== Installation ======

#[derive(Debug, Clone, Copy)]
pub enum Installation {
    System,
    User,
}
impl Installation {
    pub fn to_flatpak(
        &self,
        cancellable: Option<&Cancellable>,
    ) -> Result<flatpak::Installation, glib::Error> {
        match self {
            Installation::System => flatpak::Installation::new_system(cancellable),
            Installation::User => flatpak::Installation::new_user(cancellable),
        }
    }
}

// ====== SourceIdCollection ======

#[derive(Clone)]
pub struct SourceIdCollection {
    source_ids: Vec<u32>,
}

impl SourceIdCollection {
    pub fn new() -> SourceIdCollection {
        SourceIdCollection {
            source_ids: Vec::new(),
        }
    }

    pub fn add(&mut self, source_id: SourceId) {
        self.source_ids.push(source_id.as_raw());
    }

    pub fn remove(&mut self) {
        for s in self.source_ids.iter() {
            unsafe {
                let sid = SourceId::from_glib(s.clone());
                sid.remove();
            }
            break;
        }
    }
}

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

    pub fn install(&self, install: Installation) -> ApphubTransaction {
        run_transaction(&self.app_id().unwrap(), install, TRANSACTION_ACTION_INSTALL)
    }

    pub fn uninstall(&self, install: Installation) -> ApphubTransaction {
        run_transaction(
            &self.app_id().unwrap(),
            install,
            TRANSACTION_ACTION_UNINSTALL,
        )
    }

    pub fn update(&self, install: Installation) -> ApphubTransaction {
        run_transaction(&self.app_id().unwrap(), install, TRANSACTION_ACTION_UPDATE)
    }
}

// ====== ApphubTransaction Functions ======

fn run_transaction(app_id: &str, install: Installation, action: i32) -> ApphubTransaction {
    let transaction = ApphubTransaction::new(app_id, action);
    let mut src_ids = SourceIdCollection::new();
    let g_ctx = glib::MainContext::default();

    let (prog_sender, prog_receiver) = glib::MainContext::channel::<f64>(glib::Priority::default());
    let (err_sender, err_receiver) =
        glib::MainContext::channel::<String>(glib::Priority::default());

    let cancel = transaction.cancellable().clone();
    let action = transaction.action().clone();

    thread::spawn({
        let app_id = app_id.to_string();
        move || {
            let install = install.to_flatpak(Some(&cancel));
            if let Err(err) = install {
                err_sender.send(err.to_string()).unwrap();
                return;
            }
            let install = install.unwrap();

            let transaction = flatpak::Transaction::for_installation(&install, Some(&cancel));
            if let Err(err) = transaction {
                err_sender.send(err.to_string()).unwrap();
                return;
            }
            let transaction = transaction.unwrap();

            match action {
                TRANSACTION_ACTION_INSTALL => {
                    let bytes = get_flatpak_ref(&app_id);
                    if let Err(err) = bytes {
                        err_sender.send(err.to_string()).unwrap();
                        return;
                    }
                    let bytes = bytes.unwrap();
                    let e = transaction.add_install_flatpakref(&bytes);
                    if let Err(err) = e {
                        err_sender.send(err.to_string()).unwrap();
                        return;
                    }
                }
                TRANSACTION_ACTION_UNINSTALL => {
                    panic!("Not implemented");
                }
                TRANSACTION_ACTION_UPDATE => {
                    panic!("Not implemented");
                }
                _ => {
                    panic!("Invalid action");
                }
            };

            transaction.connect_new_operation(move |transaction, operation, progress| {
                let prog_sender = prog_sender.clone();
                let transaction = transaction.clone();
                let operation = operation.clone();
                progress.connect_changed(move |progress| {
                    let prog = get_progress(&transaction, &operation, &progress);
                    prog_sender.send(prog).unwrap();
                });
            });

            let res = transaction.run(Some(&cancel));
            if let Err(err) = res {
                err_sender.send(err.to_string()).unwrap();
                return;
            }
        }
    });

    src_ids.add(prog_receiver.attach(Some(&g_ctx), {
        let transaction = transaction.clone();
        move |prog| {
            transaction.set_progress(prog);
            glib::ControlFlow::Continue
        }
    }));

    src_ids.add(err_receiver.attach(Some(&g_ctx), {
        let mut src_ids = src_ids.clone();
        let transaction = transaction.clone();
        move |err| {
            transaction.set_error(err);
            src_ids.remove();
            glib::ControlFlow::Continue
        }
    }));

    transaction.cancellable().clone().connect_cancelled_local({
        let mut src_ids = src_ids.clone();
        move |_| {
            src_ids.remove();
        }
    });

    return transaction;
}

// ====== Helper Functions ======

pub fn get_progress(
    transaction: &flatpak::Transaction,
    operation: &flatpak::TransactionOperation,
    progress: &flatpak::TransactionProgress,
) -> f64 {
    let total = transaction
        .operations()
        .iter()
        .fold(0, |acc, x| acc + x.installed_size() + x.download_size());
    let install_size = operation.installed_size() + operation.download_size();
    let bytes_transferred =
        install_size as f64 - (install_size as f64 / progress.progress() as f64);
    let prev_ops_size = transaction
        .operations()
        .iter()
        .take_while(|x| x.to_owned() != operation)
        .fold(0, |acc, x| acc + x.installed_size() + x.download_size());

    let weight = (prev_ops_size as f64 + bytes_transferred) / total as f64;
    return weight;
}

fn get_flatpak_ref(app_id: &str) -> reqwest::Result<glib::Bytes> {
    let bytes = reqwest::blocking::get(&format!("{}/{}.flatpakref", REF_BASE_URL, app_id))?;
    let bytes = bytes.bytes()?;
    let bytes = glib::Bytes::from(&bytes);
    return Ok(bytes);
}
