use std::thread;

use crate::prelude::*;
use super::{installation::InstallLocation, source_id_collection::SourceIdCollection, helpers::{get_flatpak_ref, get_progress}, transaction::ApphubTransaction};


pub fn run_transaction(app_id: &str, install: InstallLocation, action: i32) -> ApphubTransaction {
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

            let transaction = libflatpak::Transaction::for_installation(&install, Some(&cancel));
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
