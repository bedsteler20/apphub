
mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/app_page.blp")]
    pub struct ApphubAppPage {
        #[template_child]
        pub icon: TemplateChild<gtk::Image>,
        #[template_child]
        pub name_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub dev_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub install_btn_container: TemplateChild<adw::Bin>,
        #[template_child]
        pub caracal_container: TemplateChild<adw::Clamp>,
        #[template_child]
        pub summary_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub description_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub app_links: TemplateChild<adw::Bin>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppPage {
        const NAME: &'static str = "ApphubAppPage";
        type Type = super::ApphubAppPage;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppPage {}
    impl WidgetImpl for ApphubAppPage {}
    impl BinImpl for ApphubAppPage {}
}

glib::wrapper! {
    pub struct ApphubAppPage(ObjectSubclass<imp::ApphubAppPage>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}
