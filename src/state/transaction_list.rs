use crate::models::InstalledApp;
use gio::prelude::*;
use gio::subclass::prelude::*;
use std::cell::RefCell;

use crate::models::{ApphubTransaction, InstallLocation, TransactionType};

mod imp {
    use super::*;

    #[derive(Debug, Default)]
    pub struct TransactionList {
        pub list: RefCell<Vec<ApphubTransaction>>,
    }
    #[glib::object_subclass]
    impl ObjectSubclass for TransactionList {
        const NAME: &'static str = "TransactionList";
        type Type = super::TransactionList;
        type Interfaces = (gio::ListModel,);
    }

    impl ObjectImpl for TransactionList {}

    impl ListModelImpl for TransactionList {
        fn item_type(&self) -> glib::Type {
            ApphubTransaction::static_type()
        }

        fn n_items(&self) -> u32 {
            self.list.borrow().len() as u32
        }

        fn item(&self, position: u32) -> Option<glib::Object> {
            self.list
                .borrow()
                .get(position as usize)
                .map(|v| v.clone().upcast())
        }
    }
}

glib::wrapper! {
    pub struct TransactionList(ObjectSubclass<imp::TransactionList>)
        @implements gio::ListModel;
}

impl TransactionList {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    fn add(&self, transaction: ApphubTransaction) {
        let mut list = self.imp().list.borrow_mut();
        list.push(transaction);
        self.items_changed(list.len() as u32, 0, 1);
    }

    fn remove(&self, transaction: &ApphubTransaction) {
        let mut list = self.imp().list.borrow_mut();
        let index = list
            .iter()
            .position(|t| t.id() == transaction.id())
            .unwrap();
        list.remove(index);
        self.items_changed(list.len() as u32, 0, 1);
    }

    fn bind_transaction(&self, transaction: &ApphubTransaction) {
        transaction.connect_is_done_notify({
            let this = self.clone();
            move |transaction| {
                if transaction.is_done() {
                    this.remove(transaction);
                }
            }
        });
        transaction.connect_error_notify({
            let this = self.clone();
            move |transaction| {
                if let Some(error) = transaction.error() {
                    // TODO: Show error (probably trigger a gtk action)
                    println!("Transaction error: {:?}", error);
                    this.remove(transaction);
                }
            }
        });
    }

    pub fn has_transaction(&self, app_id: &str) -> bool {
        let list = self.imp().list.borrow();
        list.iter().any(|t| t.app_id() == app_id)
    }
    pub fn get_transaction(&self, app_id: &str) -> Option<ApphubTransaction> {
        let list = self.imp().list.borrow();
        list.iter().find(|t| t.app_id() == app_id).cloned()
    }

    pub fn add_install(&self, app_id: String, bundle: String) -> ApphubTransaction {
        let transaction = ApphubTransaction::new(
            app_id,
            InstallLocation::User,
            "flathub".to_string(),
            bundle,
            TransactionType::Install,
        );
        self.bind_transaction(&transaction);
        self.add(transaction.clone());
        transaction
    }

    pub fn add_update(&self, app: InstalledApp) -> ApphubTransaction {
        let transaction = ApphubTransaction::new(
            app.app_id(),
            app.install_location(),
            app.remote(),
            app.ref_path(),
            TransactionType::Update,
        );
        self.bind_transaction(&transaction);
        self.add(transaction.clone());
        transaction
    }

    pub fn add_uninstall(&self, app: InstalledApp) -> ApphubTransaction {
        let transaction = ApphubTransaction::new(
            app.app_id(),
            app.install_location(),
            app.remote(),
            app.ref_path(),
            TransactionType::Uninstall,
        );
        self.bind_transaction(&transaction);
        self.add(transaction.clone());
        transaction
    }
}
