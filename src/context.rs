
mod imp {
    use std::cell::RefCell;

    use glib::subclass::prelude::*;

    #[derive(Default)]
    pub struct ApphubContext {
        pub client: RefCell<Option<crate::flathub_client::Client>>,
    }

    impl ApphubContext {
        pub fn uu() {}
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubContext {
        const NAME: &'static str = "ApphubContext";
        type Type = super::ApphubContext;
    }
    impl ObjectImpl for ApphubContext {}
}

glib::wrapper! {
    pub struct ApphubContext(ObjectSubclass<imp::ApphubContext>);
}

impl ApphubContext {
    fn client(&self) -> crate::flathub_client::Client {

    }

}