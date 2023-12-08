use super::InstallLocation;
use crate::prelude::*;
use crate::utils::REF_BASE_URL;

pub fn install_app(ctx: &Context, location: InstallLocation, app_id: &String) {
    struct Data {
        pub progress: f64,
        pub is_done: bool,
        pub error: Option<String>,
    }
    let app_id = app_id.to_string();
    let (sender, reviver) = glib::MainContext::channel::<Data>(glib::Priority::DEFAULT);
    let (cancel_sender, cancel_receiver) = mpsc::channel::<bool>();

    // ======== Install Thread ========
    runtime.spawn(clone!(@strong sender, @strong app_id => async move {
        let bytes = reqwest::get(format!("{}/{}.flatpakref", REF_BASE_URL, app_id)).await;
        if let Err(e) = bytes {
            sender.send(Data {
                    progress: 0.0,
                    is_done: true,
                    error: Some(e.to_string()),
                }).unwrap();
            return;
        }
        let bytes: Bytes = bytes.unwrap().bytes().await.unwrap().as_ref().into();

        let cancel = gio::Cancellable::new();
        let install: libflatpak::Installation = location.into();
        let transaction = libflatpak::Transaction::for_installation(&install, Some(&cancel));
        if let Err(e) = transaction {
            sender.send(Data {
                progress: 0.0,
                is_done: true,
                error: Some(e.to_string()),
            }).unwrap();
            return;
        }

        let transaction = transaction.unwrap();
        if let Err(e) = transaction.add_install_flatpakref(&bytes) {
            sender.send(Data {
                progress: 0.0,
                is_done: true,
                error: Some(e.to_string()),
            }).unwrap();
            return;
        }

        transaction.connect_new_operation(clone!(@strong sender => move |transaction, operation, progress| {
            let transaction = transaction.clone();
            let operation = operation.clone();
            progress.connect_changed(clone!(@strong sender => move |progress| {
                sender.send(Data {
                    progress: get_progress(&transaction, &operation, &progress),
                    is_done: false,
                    error: None,
                }).unwrap();
            }));
        }));

        let result = transaction.run(Some(&cancel));
        if let Err(e) = result {
            sender.send(Data {
                progress: 0.0,
                is_done: true,
                error: Some(e.to_string()),
            }).unwrap();
            return;
        }

        loop {
            if cancel_receiver.try_recv().is_ok() {
                cancel.cancel();
                sender.send(Data {
                    progress: 0.0,
                    is_done: true,
                    error: None,
                }).unwrap();
                return;
            }
        }
    }));

    // ======== Main Thread ========
    ctx.transaction_store.add(store::Transaction {
        app_id: app_id.clone(),
        progress: 0.0,
        state: store::TransactionState::Install,
        stage: store::TransactionStage::Start,
        error: None,
        canaled: false,
    });

    reviver.attach(
        Some(&glib::MainContext::default()),
        clone!(@strong ctx, @strong app_id => move |data| {
            if data.error.is_some() {
                ctx.transaction_store.update(store::Transaction {
                    app_id: app_id.clone(),
                    progress: 0.0,
                    state: store::TransactionState::Install,
                    stage: store::TransactionStage::End,
                    error: data.error,
                    canaled: false,
                });
                return glib::ControlFlow::Break;
            }

            if data.is_done {
                ctx.transaction_store.update(store::Transaction {
                    app_id: app_id.clone(),
                    progress: 1.0,
                    state: store::TransactionState::Install,
                    stage: store::TransactionStage::End,
                    error: None,
                    canaled: false,
                });
                return glib::ControlFlow::Break;
            }

            ctx.transaction_store.update(store::Transaction {
                app_id: app_id.clone(),
                progress: data.progress,
                state: store::TransactionState::Install,
                stage: store::TransactionStage::Progress,
                error: None,
                canaled: false,
            });

            return glib::ControlFlow::Continue;
        }),
    );
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
    return weight;
}
