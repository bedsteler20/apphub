
mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/widgets/app_links.blp")]
    pub struct ApphubAppLinks {
        #[template_child]
        pub flow: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub install_size_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub install_size_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub download_size_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub download_size_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub arch_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub arch_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub license_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub license_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub website_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub website_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub issues_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub issues_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub contribute_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub contribute_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub help_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub help_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub translate_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub translate_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub donate_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub donate_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub manifest_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub manifest_label: TemplateChild<gtk::Label>,

    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppLinks {
        const NAME: &'static str = "ApphubAppLinks";
        type Type = super::ApphubAppLinks;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppLinks {}
    impl WidgetImpl for ApphubAppLinks {}
    impl BinImpl for ApphubAppLinks {}
}

glib::wrapper! {
    pub struct ApphubAppLinks(ObjectSubclass<imp::ApphubAppLinks>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}