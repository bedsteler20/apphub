use glib::{subclass::prelude::*, Cast};

mod imp {
    use super::*;

    #[derive(Debug, Default)]
    pub struct Context {
        pub(super) transactions: glib::WeakRef<gio::ListStore>,
        pub(super) application: glib::WeakRef<crate::application::ApphubApplication>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for Context {
        const NAME: &'static str = "Context";
        type Type = super::Context;
    }

    impl ObjectImpl for Context {
        fn constructed(&self) {
            self.parent_constructed();
            let binding = self.obj();
            let this = binding.imp();
            this.transactions.set(Some(
                &gio::ListStore::new::<crate::models::ApphubTransaction>(),
            ));
        }
    }
}

glib::wrapper! {
    pub struct Context(ObjectSubclass<imp::Context>);
}

impl Context {
    pub fn new(application: &crate::application::ApphubApplication) -> Self {
        let this: Self = glib::Object::builder().build();
        this.imp().application.set(Some(application));
        this
    }

    pub fn transactions(&self) -> gio::ListStore {
        self.imp()
            .transactions
            .upgrade()
            .expect("transactions not initialized in Context")
    }

    pub fn application(&self) -> crate::application::ApphubApplication {
        self.imp()
            .application
            .upgrade()
            .expect("application not initialized in Context")
    }

    pub fn window(&self) -> crate::views::ApphubWindow {
        self.imp()
            .application
            .upgrade()
            .expect("window not initialized in Context")
            .main_window()
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
