use libflatpak::{gio::Cancellable, prelude::*};
use shared::RUNTIME;
use tokio::sync::Mutex;
use zbus::{dbus_interface, fdo, SignalContext};

use crate::helpers::{get_flatpak_ref, TransactionState, track_transaction};

pub struct ApphubPortal {
    store: Mutex<Vec<dbus_types::Transaction>>,
}

#[dbus_interface(name = "dev.bedsteler20.Apphub.Portal")]
impl ApphubPortal {
    /// Get the AppInfo for the specified app.
    /// This function searches both the system and user installs for the app.
    /// If the app is not found, an error is returned.
    ///
    /// # Arguments
    ///
    /// - `app_id` - The app ID of the app to search for.
    ///
    /// # Returns
    ///
    /// The AppInfo for the specified app.
    ///
    /// # Errors
    ///
    /// If the app is not found, an error is returned.
    async fn get_app_info(&self, app_id: &str) -> fdo::Result<dbus_types::AppInfo> {
        let u_install = libflatpak::Installation::new_user(Cancellable::NONE)
            .map_err(|e| fdo::Error::Failed(e.to_string()))?;
        let s_install = libflatpak::Installation::new_system(Cancellable::NONE)
            .map_err(|e| fdo::Error::Failed(e.to_string()))?;

        for i in vec![u_install, s_install] {
            let refs = i
                .list_installed_refs(Cancellable::NONE)
                .map_err(|e| fdo::Error::Failed(e.to_string()))?;
            for r in refs {
                if r.name().unwrap() == app_id {
                    return Ok(r.into());
                }
            }
        }
        return Err(fdo::Error::Failed("App not found".into()));
    }

    /// Check if the app is installed
    async fn is_app_installed(&self, app_id: &str) -> fdo::Result<bool> {
        return match self.get_app_info(app_id).await {
            Ok(_) => Ok(true),
            Err(_) => Ok(false),
        };
    }

    /// List all transactions in the store. This will lock the store and clone it
    async fn list_transactions(&self) -> fdo::Result<Vec<dbus_types::Transaction>> {
        let store = self.store.lock().await;
        Ok(store.clone())
    }

    /// Get a transaction by its id
    /// This will lock the store and iterate over it to find the transaction
    async fn get_transaction(&self, transaction_id: u32) -> fdo::Result<dbus_types::Transaction> {
        let store = self.store.lock().await;
        let transaction = store.iter().find(|t| t.id == transaction_id).unwrap();
        Ok(transaction.clone())
    }

    /// This crates a new transaction and returns the transaction id
    /// The transaction id is will be use when calling install, uninstall, update, etc.
    /// This is so that the client get the id before the transaction starts
    /// because actually running the transaction will occupy the thread handling the request
    /// and the client will not be able to get the id. This way the client can get the id
    /// and track the progress of the transaction while its running
    async fn create_transaction(
        &self,
        app_id: &str,
        install_location: dbus_types::InstallLocation,
        transaction_type: dbus_types::TransactionType,
        #[zbus(signal_context)] ctx: SignalContext<'_>,
    ) -> fdo::Result<u32> {
        let mut store = self.store.lock().await;
        let transaction = dbus_types::Transaction::new(app_id, install_location, transaction_type);
        let id = transaction.id;
        store.push(transaction.clone());
        println!("Transaction added");
        Self::transaction_added(&ctx, transaction.clone())
            .await
            .unwrap();
        Ok(id)
    }

    async fn install(
        &self,
        transaction_id: u32,
        #[zbus(signal_context)] ctx: SignalContext<'_>,
    ) -> fdo::Result<()> {
        let store = self.store.lock().await;
        let transaction = (*store)
            .iter()
            .find(|t| t.id == transaction_id)
            .unwrap()
            .clone();
        if transaction.transaction_type != dbus_types::TransactionType::Install {
            return Err(fdo::Error::Failed(
                "Transaction is not an install transaction".into(),
            ));
        }

        let (sender, receiver) = std::sync::mpsc::channel::<TransactionState>();

        RUNTIME.spawn(async move {
            let cancellable = Cancellable::NONE;
            let install: libflatpak::Installation = transaction.install_location.into();
            let app_id = transaction.app_id;
            let transaction = libflatpak::Transaction::for_installation(&install, cancellable);
            if let Err(e) = transaction {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            let transaction = transaction.unwrap();

            let ref_file = get_flatpak_ref(&app_id);
            if let Err(e) = ref_file {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            let ref_file = ref_file.unwrap();
            if let Err(e) = transaction.add_install_flatpakref(&ref_file) {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            track_transaction(&sender, &transaction);
            let res = transaction.run(cancellable);
            if let Err(e) = res {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            } else {
                sender.send(TransactionState::Done).unwrap();
            }
        });

        loop {
            let msg = receiver.recv().unwrap();
            match msg {
                TransactionState::Progress(progress) => {
                    let mut store = self.store.lock().await;
                    let transaction = store.iter_mut().find(|t| t.id == transaction_id).unwrap();
                    (*transaction).progress = progress;
                    Self::progress_changed(&ctx, transaction_id, progress)
                        .await
                        .unwrap();
                }
                TransactionState::Error(error) => {
                    let mut store = self.store.lock().await;
                    let transaction = store.iter_mut().find(|t| t.id == transaction_id).unwrap();
                    (*transaction).error = error;
                }
                TransactionState::Done => {
                    let mut store = self.store.lock().await;
                    (*store).retain(|t| t.id != transaction_id);
                    Self::transaction_done(&ctx, transaction_id).await.unwrap();
                    break;
                }
            }
        }

        Ok(())
    }

    async fn uninstall(
        &self,
        transaction_id: u32,
        #[zbus(signal_context)] ctx: SignalContext<'_>,
    ) -> fdo::Result<()> {
        let store = self.store.lock().await;
        let transaction = (*store)
            .iter()
            .find(|t| t.id == transaction_id)
            .unwrap()
            .clone();
        if transaction.transaction_type != dbus_types::TransactionType::Uninstall {
            return Err(fdo::Error::Failed(
                "Transaction is not an uninstall transaction".into(),
            ));
        }
        let info = self.get_app_info(&transaction.app_id).await?;

        let (sender, receiver) = std::sync::mpsc::channel::<TransactionState>();

        RUNTIME.spawn(async move {
            let cancellable = Cancellable::NONE;
            let install: libflatpak::Installation = transaction.install_location.into();
            let transaction = libflatpak::Transaction::for_installation(&install, cancellable);
            if let Err(e) = transaction {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            let transaction = transaction.unwrap();

            if let Err(e) = transaction.add_uninstall(&info.flatpak_ref) {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            track_transaction(&sender, &transaction);
            let res = transaction.run(cancellable);
            if let Err(e) = res {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            } else {
                sender.send(TransactionState::Done).unwrap();
            }
        });

        loop {
            let msg = receiver.recv().unwrap();
            match msg {
                TransactionState::Progress(progress) => {
                    let mut store = self.store.lock().await;
                    let transaction = store.iter_mut().find(|t| t.id == transaction_id).unwrap();
                    (*transaction).progress = progress;
                    Self::progress_changed(&ctx, transaction_id, progress)
                        .await
                        .unwrap();
                }
                TransactionState::Error(error) => {
                    let mut store = self.store.lock().await;
                    let transaction = store.iter_mut().find(|t| t.id == transaction_id).unwrap();
                    (*transaction).error = error;
                }
                TransactionState::Done => {
                    let mut store = self.store.lock().await;
                    (*store).retain(|t| t.id != transaction_id);
                    Self::transaction_done(&ctx, transaction_id).await.unwrap();
                    break;
                }
            }
        }

        Ok(())
    }

    
    async fn update(
        &self,
        transaction_id: u32,
        #[zbus(signal_context)] ctx: SignalContext<'_>,
    ) -> fdo::Result<()> {
        let store = self.store.lock().await;
        let transaction = (*store)
            .iter()
            .find(|t| t.id == transaction_id)
            .unwrap()
            .clone();
        if transaction.transaction_type != dbus_types::TransactionType::Update {
            return Err(fdo::Error::Failed(
                "Transaction is not an update transaction".into(),
            ));
        }
        let info = self.get_app_info(&transaction.app_id).await?;
        let (sender, receiver) = std::sync::mpsc::channel::<TransactionState>();

        RUNTIME.spawn(async move {
            let cancellable = Cancellable::NONE;
            let install: libflatpak::Installation = transaction.install_location.into();
            let transaction = libflatpak::Transaction::for_installation(&install, cancellable);
            if let Err(e) = transaction {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            let transaction = transaction.unwrap();

            if let Err(e) = transaction.add_update(&info.flatpak_ref, &[], None) {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            }
            track_transaction(&sender, &transaction);
            let res = transaction.run(cancellable);
            if let Err(e) = res {
                sender.send(TransactionState::Error(e.to_string())).unwrap();
                return;
            } else {
                sender.send(TransactionState::Done).unwrap();
            }
        });

        loop {
            let msg = receiver.recv().unwrap();
            match msg {
                TransactionState::Progress(progress) => {
                    let mut store = self.store.lock().await;
                    let transaction = store.iter_mut().find(|t| t.id == transaction_id).unwrap();
                    (*transaction).progress = progress;
                    Self::progress_changed(&ctx, transaction_id, progress)
                        .await
                        .unwrap();
                }
                TransactionState::Error(error) => {
                    let mut store = self.store.lock().await;
                    let transaction = store.iter_mut().find(|t| t.id == transaction_id).unwrap();
                    (*transaction).error = error;
                }
                TransactionState::Done => {
                    let mut store = self.store.lock().await;
                    (*store).retain(|t| t.id != transaction_id);
                    Self::transaction_done(&ctx, transaction_id).await.unwrap();
                    break;
                }
            }
        }

        Ok(())
    }

    
    async fn apps_with_updates(&self) -> fdo::Result<Vec<dbus_types::AppInfo>>  {
        let mut apps = Vec::new();
        
        let u_install = libflatpak::Installation::new_user(Cancellable::NONE)
            .map_err(|e| fdo::Error::Failed(e.to_string()))?;
        let s_install = libflatpak::Installation::new_system(Cancellable::NONE)
            .map_err(|e| fdo::Error::Failed(e.to_string()))?;

        for i in vec![u_install, s_install] {
            let refs = i
                .list_installed_refs(Cancellable::NONE)
                .map_err(|e| fdo::Error::Failed(e.to_string()))?;
            for r in refs {
                apps.push(r.into());
            }
        }

        return Ok(apps);
    }


    #[dbus_interface(signal)]
    async fn progress_changed(
        ctx: &SignalContext<'_>,
        transaction_id: u32,
        progress: f64,
    ) -> Result<(), zbus::Error>;

    #[dbus_interface(signal)]
    async fn transaction_added(
        ctx: &SignalContext<'_>,
        transaction: dbus_types::Transaction,
    ) -> Result<(), zbus::Error>;

    #[dbus_interface(signal)]
    async fn transaction_error(
        ctx: &SignalContext<'_>,
        transaction_id: u32,
        error: String,
    ) -> Result<(), zbus::Error>;

    #[dbus_interface(signal)]
    async fn transaction_done(
        ctx: &SignalContext<'_>,
        transaction_id: u32,
    ) -> Result<(), zbus::Error>;
}
