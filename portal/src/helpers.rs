use libflatpak::prelude::*;
use std::sync::{mpsc::Sender, };

pub enum TransactionState {
    Done,
    Error(String),
    Progress(f64),
}

pub fn track_transaction(sender: &Sender<TransactionState>, transaction: &libflatpak::Transaction) {
    let sender = sender.clone();
    let transaction = transaction.clone();

    transaction.connect_operation_error({
        let sender = sender.clone();
        move |_, _, err, _| {
            sender
                .send(TransactionState::Error(err.to_string()))
                .unwrap();
            return false;
        }
    });

    transaction.connect_new_operation({
        let sender = sender.clone();
        move |transaction, operation, progress| {
            let sender = sender.clone();
            let transaction = transaction.clone();
            let operation = operation.clone();
            progress.connect_changed(move |progress| {
                let prog = get_progress(&transaction, &operation, &progress);
                if prog < 0.0 || prog > 1.0 {
                    return;
                }
                sender.send(TransactionState::Progress(prog)).unwrap();
            });
        }
    });


}



pub fn get_progress(
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
   return weight;
}

pub fn get_flatpak_ref(app_id: &str) -> reqwest::Result<glib::Bytes> {
    let bytes = reqwest::blocking::get(&format!("https://dl.flathub.org/repo/appstream/{}.flatpakref", app_id))?;
    let bytes = bytes.bytes()?;
    let bytes = glib::Bytes::from(&bytes);
    return Ok(bytes);
}
