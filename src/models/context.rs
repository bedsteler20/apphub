use glib::{subclass::prelude::*, Cast};

use crate::{
    application::ApphubApplication,
    models::{transaction_list::TransactionList, InstalledAppsList, UpdatesList},
    views::ApphubWindow,
};
use once_cell::sync::OnceCell;

mod imp {

    use super::*;

    #[derive(Debug, Default)]
    pub struct Context {
        pub(super) transactions: OnceCell<TransactionList>,
        pub(super) application: OnceCell<ApphubApplication>,
        pub(super) updates: OnceCell<UpdatesList>,
        pub(super) installed_apps: OnceCell<InstalledAppsList>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for Context {
        const NAME: &'static str = "ApphubContext";
        type Type = super::Context;
    }

    impl ObjectImpl for Context {
        fn constructed(&self) {
            self.parent_constructed();

            let transactions = TransactionList::new();
            let updates_list = UpdatesList::new();
            let installed_apps = InstalledAppsList::new();

            installed_apps.bind_transaction_list(&transactions);

            self.transactions
                .set(transactions)
                .expect("Failed to initialize transactions in Context");
            self.updates
                .set(updates_list)
                .expect("Failed to initialize updates_list in Context");
            self.installed_apps
                .set(installed_apps)
                .expect("Failed to initialize installed_apps_list in Context");
        }
    }
}

glib::wrapper! {
    pub struct Context(ObjectSubclass<imp::Context>);
}

impl Context {
    pub fn new(application: &crate::application::ApphubApplication) -> Self {
        let this: Self = glib::Object::builder().build();
        this.imp().application.set(application.clone()).unwrap();
        this
    }

    pub fn transactions(&self) -> TransactionList {
        self.imp()
            .transactions
            .get()
            .expect("transactions not initialized in Context")
            .clone()
    }

    pub fn application(&self) -> crate::application::ApphubApplication {
        self.imp()
            .application
            .get()
            .expect("application not initialized in Context")
            .clone()
    }

    pub fn window(&self) -> ApphubWindow {
        self.imp()
            .application
            .get()
            .expect("application not initialized in Context")
            .main_window()
    }

    pub fn updates(&self) -> UpdatesList {
        self.imp()
            .updates
            .get()
            .expect("updates_list not initialized in Context")
            .clone()
    }

    pub fn installed_apps(&self) -> InstalledAppsList {
        self.imp()
            .installed_apps
            .get()
            .expect("installed_apps_list not initialized in Context")
            .clone()
    }
}

impl Default for Context {
    fn default() -> Self {
        let g_app = gio::Application::default()
            .expect("Gio Application not initialized. Context cannot be retrieved.");
        let app = g_app
            .downcast_ref::<crate::application::ApphubApplication>()
            .expect("Gio Application is not an ApphubApplication. Context cannot be retrieved.");
        app.context()
    }
}
