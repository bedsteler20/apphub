use glib::{subclass::prelude::*, Cast};

use crate::{
    application::ApphubApplication,
    models::{transaction_list::TransactionList, UpdatesList},
    views::ApphubWindow,
};
mod imp {

    use once_cell::sync::OnceCell;

    use super::*;

    #[derive(Debug, Default)]
    pub struct Context {
        pub(super) transactions: OnceCell<TransactionList>,
        pub(super) application: OnceCell<ApphubApplication>,
        pub(super) updates_list: OnceCell<UpdatesList>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for Context {
        const NAME: &'static str = "Context";
        type Type = super::Context;
    }

    impl ObjectImpl for Context {
        fn constructed(&self) {
            self.parent_constructed();

            self.transactions.set(TransactionList::new()).unwrap();
            self.updates_list.set(UpdatesList::new()).unwrap();
            println!("Context constructed");
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
            .expect("transactions not initialized in Context").clone()
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

    pub fn updates_list(&self) -> UpdatesList {
        self.imp()
            .updates_list
            .get()
            .expect("updates_list not initialized in Context")
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
