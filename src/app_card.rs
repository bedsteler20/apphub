
mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/app_card.blp")]
    pub struct ApphubAppCard {
        #[template_child]
        pub name_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub description_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub image: TemplateChild<gtk::Image>,
        #[template_child]
        pub verified_box: TemplateChild<gtk::Box>,
        #[template_child]
        pub verified_label: TemplateChild<gtk::Label>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppCard {
        const NAME: &'static str = "ApphubAppCard";
        type Type = super::ApphubAppCard;
        type ParentType = gtk::Button;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppCard {}
    impl WidgetImpl for ApphubAppCard {}
    impl ButtonImpl for ApphubAppCard {}
}

glib::wrapper! {
    pub struct ApphubAppCard(ObjectSubclass<imp::ApphubAppCard>)
    @extends gtk::Button, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable, 
                gtk::ConstraintTarget, gtk::Actionable;
}