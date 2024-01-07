use adw::prelude::*;

use crate::application::ApphubApplication;
use crate::utils::Findable;
use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::CompositeTemplate;

mod imp {
    use crate::views::{ApphubHomePage, InstalledAppsPage, UpdatesAppsPage};

    use super::*;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/views/window.blp")]
    pub struct ApphubWindow {
        #[template_child]
        pub router: TemplateChild<rose::Router>,
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

    impl ObjectImpl for ApphubWindow {
        fn constructed(&self) {
            self.parent_constructed();
            self.router
                .add_main_route::<ApphubHomePage>("Explore", "compass-symbolic");
            self.router
                .add_main_route::<InstalledAppsPage>("Installed", "folder-symbolic");
            self.router
                .add_main_route::<UpdatesAppsPage>("Updates", "update-symbolic");
            rose::visit::<ApphubHomePage>(None);
        }
    }
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
}

impl ApphubWindow {
    pub fn new(app: &ApphubApplication) -> Self {
        let this: Self = glib::Object::builder().build();
        this.set_application(Some(app));
        this
    }
}

impl Findable for ApphubWindow {
    fn find() -> Self {
        ApphubApplication::find().main_window()
    }
}
