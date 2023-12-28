use gtk::CompositeTemplate;
use glib::subclass::InitializingObject;
use gtk::prelude::*;
use gtk::subclass::prelude::*;

use super::load_image;

mod imp {

    use super::*;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/widgets/app_card.blp")]
    pub struct AppCard {
        #[template_child]
        pub icon: TemplateChild<gtk::Image>,
        #[template_child]
        pub name_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub description_label: TemplateChild<gtk::Label>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for AppCard {
        const NAME: &'static str = "ApphubAppCard2";
        type Type = super::AppCard;
        type ParentType = gtk::Box;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for AppCard {}
    impl WidgetImpl for AppCard {}
    impl BoxImpl for AppCard {}
}

glib::wrapper! {
    pub struct AppCard(ObjectSubclass<imp::AppCard>)
        @extends gtk::Box, gtk::Widget,
        @implements gtk::Accessible, gtk::Buildable,
                    gtk::ConstraintTarget, gtk::Orientable;
}

impl AppCard {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    pub fn set_icon_url(&self, icon: String) {
        load_image(&icon, &self.imp().icon);
    }

    pub fn set_icon_file(&self, file: String) {
        self.imp().icon.set_from_file(Some(&file));
    }

    pub fn set_name(&self, name: String) {
        self.imp().name_label.set_text(&name);
    }

    pub fn set_description(&self, description: String) {
        self.imp().description_label.set_text(&description);
    }
}