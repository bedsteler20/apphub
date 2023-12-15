mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/app_grid.blp")]
    pub struct ApphubAppGrid {
        #[template_child]
        pub flow: TemplateChild<gtk::FlowBox>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppGrid {
        const NAME: &'static str = "ApphubAppGrid";
        type Type = super::ApphubAppGrid;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppGrid {}
    impl WidgetImpl for ApphubAppGrid {}
    impl BinImpl for ApphubAppGrid {}
}

glib::wrapper! {
    pub struct ApphubAppGrid(ObjectSubclass<imp::ApphubAppGrid>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}
