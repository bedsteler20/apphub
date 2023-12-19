mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/widgets/install_btn.blp")]
    pub struct ApphubInstallBtn {
        #[template_child]
        pub install_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub update_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub open_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub progress_box: TemplateChild<gtk::Box>,
        #[template_child]
        pub progress_bar: TemplateChild<gtk::ProgressBar>,
        #[template_child]
        pub progress_label: TemplateChild<gtk::Label>,
        #[template_child]   
        pub uninstall_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub cancel_btn: TemplateChild<gtk::Button>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubInstallBtn {
        const NAME: &'static str = "ApphubInstallBtn";
        type Type = super::ApphubInstallBtn;
        type ParentType = gtk::Box;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubInstallBtn {}
    impl WidgetImpl for ApphubInstallBtn {}
    impl BoxImpl for ApphubInstallBtn {}
}

glib::wrapper! {
    pub struct ApphubInstallBtn(ObjectSubclass<imp::ApphubInstallBtn>)
    @extends gtk::Box, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}
