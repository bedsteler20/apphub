mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/window.blp")]
    pub struct ApphubWindow {
        #[template_child]
        pub header_bar: TemplateChild<adw::HeaderBar>,
        #[template_child]
        pub back_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub view_switcher: TemplateChild<adw::ViewSwitcher>,
        #[template_child]
        pub view_stack: TemplateChild<adw::ViewStack>,
        #[template_child]
        pub switcher_bar: TemplateChild<adw::ViewSwitcherBar>,
        #[template_child]
        pub nav_stack: TemplateChild<adw::NavigationView>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubWindow {
        const NAME: &'static str = "ApphubWindow";
        type Type = super::ApphubWindow;
        type ParentType = adw::ApplicationWindow;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubWindow {}
    impl ApplicationWindowImpl for ApphubWindow {}
    impl AdwApplicationWindowImpl for ApphubWindow {}
    impl WindowImpl for ApphubWindow {}
    impl WidgetImpl for ApphubWindow {}
}

glib::wrapper! {
    pub struct ApphubWindow(ObjectSubclass<imp::ApphubWindow>)
    @extends adw::ApplicationWindow, gtk::ApplicationWindow,
             gtk::Window, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable, gtk::ConstraintTarget,
                gtk::Native, gtk::Root, gtk::ShortcutManager,
                gio::ActionGroup, gio::ActionMap;
}

impl ApphubWindow {
    pub fn new(app: &adw::Application) -> Self {
        glib::Object::builder()
            .property("application", app)
            .build()
    }
}
