
mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/screenshots_caracal.blp")]
    pub struct ApphubScreenshotCaracal {
        #[template_child]
        pub content: TemplateChild<gtk::Box>,
        #[template_child]
        pub carousel: TemplateChild<adw::Carousel>,
        #[template_child]
        pub carousel_indicator: TemplateChild<adw::CarouselIndicatorDots>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubScreenshotCaracal {
        const NAME: &'static str = "ApphubScreenshotCaracal";
        type Type = super::ApphubScreenshotCaracal;
        type ParentType = gtk::Box;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubScreenshotCaracal {}
    impl WidgetImpl for ApphubScreenshotCaracal {}
    impl BoxImpl for ApphubScreenshotCaracal {}
}

glib::wrapper! {
    pub struct ApphubScreenshotCaracal(ObjectSubclass<imp::ApphubScreenshotCaracal>)
        @extends gtk::Box, gtk::Widget,
        @implements gtk::Accessible, gtk::Buildable,
                    gtk::ConstraintTarget;
}