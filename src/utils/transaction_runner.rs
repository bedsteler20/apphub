use std::thread;

use glib::{Receiver, Sender};

use crate::{error::Error, models::TransactionType};
use libflatpak::prelude::*;

pub fn run_transaction(transaction: &crate::models::ApphubTransaction) {
    let (sender, receiver) = transaction_state_channel();

    let app_ref = transaction.app_ref().clone();
    let cancellable = transaction.cancellable().clone();
    let transaction_type = transaction.transaction_type();
    let install_location = transaction.install_location();
    let remote = transaction.remote().clone();

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
            TransactionType::Install => transaction.add_install(&remote, &app_ref, &[]),
            TransactionType::Update => transaction.add_update(&app_ref, &[], None),
            TransactionType::Uninstall => transaction.add_uninstall(&app_ref),
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

    let this = transaction.clone();

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

enum TransactionState {
    Progress(f64),
    Error(Error),
    Done,
}

#[allow(deprecated)]
fn transaction_state_channel() -> (Sender<TransactionState>, Receiver<TransactionState>) {
    let (sender, receiver) = glib::MainContext::channel(Default::default());
    (sender, receiver)
}

fn send_transaction_state(
    transaction: &libflatpak::Transaction,
    sender: &Sender<TransactionState>,
) {
    transaction.connect_new_operation({
        let sender = sender.clone();
        move |transaction, operation, progress| {
            let operation = operation.to_owned();
            let transaction = transaction.to_owned();
            let sender = sender.clone();
            progress.connect_changed(move |progress| {
                let progress = get_progress(&transaction, &operation, &progress);
                sender.send(TransactionState::Progress(progress)).unwrap();
            });
        }
    });

    transaction.connect_operation_error({
        let sender = sender.clone();
        move |_, _, error, _| {
            sender
                .send(TransactionState::Error(error.clone().into()))
                .unwrap();
            false
        }
    });
}

fn get_progress(
    transaction: &libflatpak::Transaction,
    operation: &libflatpak::TransactionOperation,
    progress: &libflatpak::TransactionProgress,
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
    // Clamp the weight between 0.0 and 1.0
    // other wise it can result in a inifinty which gose over gobject limits
    if weight > 1.0 {
        return 1.0;
    } else if weight < 0.0 {
        return 0.0;
    } else {
        return weight;
    }
}
