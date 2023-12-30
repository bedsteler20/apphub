
pub use adw::subclass::prelude::*;
use gtk::CompositeTemplate;

mod imp {
    use glib::subclass::InitializingObject;

    use super::*;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/views/error_page.blp")]
    pub struct ErrorPage {
        #[template_child]
        pub status: TemplateChild<adw::StatusPage>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ErrorPage {
        const NAME: &'static str = "ApphubErrorPage";
        type Type = super::ErrorPage;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ErrorPage {}
    impl WidgetImpl for ErrorPage {}
    impl BinImpl for ErrorPage {}
}

glib::wrapper! {
    pub struct ErrorPage(ObjectSubclass<imp::ErrorPage>) 
        @extends gtk::Widget, adw::Bin;
}

impl ErrorPage {
    pub fn new(err: crate::error::Error) -> Self {
        let this: Self = glib::Object::builder().build();
        let imp = this.imp();
        imp.status.set_description(Some(err.to_string().as_str()));
        return this;
    }
}