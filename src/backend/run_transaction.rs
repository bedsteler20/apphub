use std::thread;

use super::{
    helpers::{get_flatpak_ref, get_progress},
    installation::InstallLocation,
    source_id_collection::SourceIdCollection,
    transaction::ApphubTransaction,
    TRANSACTION_ACTION_INSTALL, TRANSACTION_ACTION_UNINSTALL, TRANSACTION_ACTION_UPDATE,
};
use crate::prelude::*;

pub fn run_install(app_id: &str, install: InstallLocation) -> ApphubTransaction {
    let transaction = ApphubTransaction::new(app_id, TRANSACTION_ACTION_INSTALL);
    let mut src_ids = SourceIdCollection::new();
    let g_ctx = glib::MainContext::default();

    let (prog_sender, prog_receiver) = glib::MainContext::channel::<f64>(glib::Priority::default());
    let (err_sender, err_receiver) =
        glib::MainContext::channel::<String>(glib::Priority::default());

    let cancel = transaction.cancellable().clone();

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

            transaction.connect_new_operation({
                let prog_sender = prog_sender.clone();
                move |transaction, operation, progress| {
                    let prog_sender = prog_sender.clone();
                    let transaction = transaction.clone();
                    let operation = operation.clone();
                    progress.connect_changed(move |progress| {
                        let prog = get_progress(&transaction, &operation, &progress);
                        if prog < 0.0 || prog > 1.0 {
                            return;
                        }
                        prog_sender.send(prog).unwrap();
                    });
                }
            });

            let res = transaction.run(Some(&cancel));
            if let Err(err) = res {
                err_sender.send(err.to_string()).unwrap();
                return;
            } else {
                prog_sender.send(1.0).unwrap();
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

pub fn run_update(ctx: &Context, app_id: &str) -> ApphubTransaction {
    let transaction = ApphubTransaction::new(app_id, TRANSACTION_ACTION_UPDATE);
    let mut src_ids = SourceIdCollection::new();
    let g_ctx = glib::MainContext::default();

    let (prog_sender, prog_receiver) = glib::MainContext::channel::<f64>(glib::Priority::default());
    let (err_sender, err_receiver) =
        glib::MainContext::channel::<String>(glib::Priority::default());

    let cancel = transaction.cancellable().clone();

    thread::spawn({
        let app_id = app_id.to_string();
        move || {
            let app_info = super::apps::get_installed_app(&app_id);
            if app_info.is_none() {
                err_sender
                    .send(format!("App {} is not installed", &app_id))
                    .unwrap();
                return;
            }
            let app_info = app_info.unwrap();
            let install = app_info.install_location.to_flatpak(Some(&cancel));
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

            let e = transaction.add_update(&app_info.app_path(), &[], None);
            if let Err(err) = e {
                err_sender.send(err.to_string()).unwrap();
                return;
            }

            transaction.connect_new_operation({
                let prog_sender = prog_sender.clone();
                move |transaction, operation, progress| {
                    let prog_sender = prog_sender.clone();
                    let transaction = transaction.clone();
                    let operation = operation.clone();
                    progress.connect_changed(move |progress| {
                        let prog = get_progress(&transaction, &operation, &progress);
                        if prog < 0.0 || prog > 1.0 {
                            return;
                        }
                        prog_sender.send(prog).unwrap();
                    });
                }
            });

            let res = transaction.run(Some(&cancel));
            if let Err(err) = res {
                err_sender.send(err.to_string()).unwrap();
                return;
            } else {
                prog_sender.send(1.0).unwrap();
            }
        }
    });

    src_ids.add(prog_receiver.attach(Some(&g_ctx), {
        let transaction = transaction.clone();
        let ctx = ctx.clone();
        move |prog| {
            if prog >= 1.0 {
                if let Some(index) = ctx.app_updates.find(&transaction) {
                    ctx.app_updates.remove(index);
                }
            }
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

pub fn run_uninstall(app_id: &str) -> ApphubTransaction {
    let transaction = ApphubTransaction::new(app_id, TRANSACTION_ACTION_UNINSTALL);
    let mut src_ids = SourceIdCollection::new();
    let g_ctx = glib::MainContext::default();

    let (prog_sender, prog_receiver) = glib::MainContext::channel::<f64>(glib::Priority::default());
    let (err_sender, err_receiver) =
        glib::MainContext::channel::<String>(glib::Priority::default());

    let cancel = transaction.cancellable().clone();

    thread::spawn({
        let app_id = app_id.to_string();
        move || {
            let app_info = super::apps::get_installed_app(&app_id);
            if app_info.is_none() {
                err_sender
                    .send(format!("App {} is not installed", &app_id))
                    .unwrap();
                return;
            }
            let app_info = app_info.unwrap();
            let install = app_info.install_location.to_flatpak(Some(&cancel));
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
            let e = transaction.add_uninstall(&app_info.app_path());
            if let Err(err) = e {
                err_sender.send(err.to_string()).unwrap();
                return;
            }

            transaction.connect_new_operation({
                let prog_sender = prog_sender.clone();
                move |transaction, operation, progress| {
                    let prog_sender = prog_sender.clone();
                    let transaction = transaction.clone();
                    let operation = operation.clone();
                    progress.connect_changed(move |progress| {
                        let prog = get_progress(&transaction, &operation, &progress);
                        if prog < 0.0 || prog > 1.0 {
                            return;
                        }
                        prog_sender.send(prog).unwrap();
                    });
                }
            });

            let res = transaction.run(Some(&cancel));
            if let Err(err) = res {
                err_sender.send(err.to_string()).unwrap();
                return;
            } else {
                prog_sender.send(1.0).unwrap();
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
