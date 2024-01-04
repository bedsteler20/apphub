use adw::prelude::*;
use glib::subclass::types::ObjectSubclassIsExt;

use crate::application::ApphubApplication;
use crate::navigator::{Navigator, Page};
use crate::utils::Findable;
use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::CompositeTemplate;

mod imp {
    use super::*;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/views/window.blp")]
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
        #[template_child]
        pub home_page: TemplateChild<adw::NavigationPage>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubWindow {
        const NAME: &'static str = "ApphubWindow";
        type Type = super::ApphubWindow;
        type ParentType = adw::ApplicationWindow;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
            klass.bind_template_callbacks();
            klass.install_action(
                "navigation.visit",
                Some("s"),
                super::ApphubWindow::on_navigate_action,
            );
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    #[gtk::template_callbacks]
    impl ApphubWindow {
        // The view stack isn't acutely displaying the page we are
        // just using it for the buttons and the listing for when it
        // thinks it should change the page so we can tell the nav stack
        // to change the page
        #[template_callback]
        fn on_view_stack_child_changed(&self) {
            let visible_child = self.view_stack.visible_child_name().unwrap();
            let tag = visible_child.as_str();
            self.obj().navigate_to(tag);
        }

        // When the mouse button is clicked by default libadwaita will
        // go back in the nav stack but it propagates a some waring
        // message about a invalid state so we just do it ourselves
        #[template_callback]
        fn on_back_mouse_btn(&self) {
            self.obj().navigate_back();
        }

        // When the nav stack changes page we want to update the back
        // button to be visible or not
        #[template_callback]
        fn on_nav_stack_page_changed(&self) {
            self.back_btn.set_visible(
                self.nav_stack
                    .previous_page(&self.nav_stack.visible_page().unwrap())
                    .is_some(),
            );
        }

        #[template_callback]
        fn on_back_menu_btn(&self) {
            self.obj().navigate_back();
        }
    }

    impl ObjectImpl for ApphubWindow {
        fn constructed(&self) {
            self.parent_constructed();
            self.nav_stack.push(&self.home_page.get());
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
                gio::ActionGroup, gio::ActionMap;
}

impl ApphubWindow {
    pub fn new(app: &ApphubApplication) -> Self {
        let this: Self = glib::Object::builder().build();
        this.set_application(Some(app));
        this
    }

    pub fn show_error_page(&self, err: crate::error::Error) {
        let page = crate::views::ErrorPage::new(err);
        let current = self.imp().nav_stack.get().visible_page().unwrap();
        current.set_child(Some(&page));
    }

    pub fn navigate_to(&self, url: &str) {
        let page = Page::parse(url);
        let nav_stack = self.imp().nav_stack.get();
        let nav_page = page.create_page();

        if page.is_top_level() {
            nav_stack.replace(&[nav_page]);
        } else {
            nav_stack.push(&nav_page);
        }
    }

    pub fn navigate_back(&self) {
        let nav_stack = self.imp().nav_stack.get();
        nav_stack.pop();
    }

    fn on_navigate_action(&self, _: &str, parameter: Option<&glib::Variant>) {
        let url = parameter.unwrap().get::<String>().unwrap();
        self.navigate_to(&url);
    }
}

impl Findable for ApphubWindow {
    fn find() -> Self {
        ApphubApplication::find().main_window()
    }
}
