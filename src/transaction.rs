mod imp {
    use glib::subclass::{object::ObjectImpl, types::ObjectSubclass};

    #[derive(Default, glib::Properties)]
    pub struct ApphubTransaction {
        #[property(get,set)]
        id: Cell<i32>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubTransaction {
        const NAME: &'static str = "ApphubTransaction";
        type Type = super::ApphubTransaction;
    }
   
    #[glib::derived_properties]
    impl ObjectImpl for ApphubTransaction {}

}

glib::wrapper! {
    pub struct ApphubTransaction(ObjectSubclass<imp::ApphubTransaction>);
}
