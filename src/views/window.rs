use adw::prelude::*;
use glib::subclass::types::ObjectSubclassIsExt;

use crate::application::ApphubApplication;
use crate::navigator::{Page, Navigator};
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
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubWindow {
        fn constructed(&self) {
            self.parent_constructed();

            // Setup UI
           
            self.nav_stack.push(&self.home_page.get());

            // Connect signals
            self.view_stack.connect_visible_child_notify({
                let obj = self.obj().clone();
                move |view_stack| {
                    let visible_child = view_stack.visible_child_name().unwrap();
                    let tag = visible_child.as_str();
                    obj.navigate_to(tag);
                }
            });

            self.nav_stack.connect_visible_page_notify({
                let btn = self.back_btn.get();
                move |nav_stack| {
                    if nav_stack
                        .previous_page(&nav_stack.visible_page().unwrap())
                        .is_none()
                    {
                        btn.set_visible(false);
                    } else {
                        btn.set_visible(true);
                    }
                }
            });

            self.back_btn.connect_clicked({
                let nav_stack = self.nav_stack.get();
                move |_| {
                    nav_stack.pop();
                }
            });

            // Setup actions
            let visit_action = gio::SimpleAction::new(
                "navigator.visit",
                Some(&glib::VariantType::new("s").unwrap()),
            );

            visit_action.connect_activate({
                let obj = self.obj().clone();
                move |_, parameter| {
                    let url = parameter.unwrap().get::<String>().unwrap();
                    obj.navigate_to(&url);
                }
            });

            self.obj().add_action(&visit_action);
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

    fn navigate_to(&self, url: &str) {
        let page = Page::parse(url);
        let nav_stack = self.imp().nav_stack.get();
        let nav_page = page.create_page();

        if page.is_top_level() {
            nav_stack.replace(&[nav_page]);
        } else {
            nav_stack.push(&nav_page);
        }
    }
}

impl Findable for ApphubWindow {
    fn find() -> Self {
        ApphubApplication::find().main_window()
    }
}
