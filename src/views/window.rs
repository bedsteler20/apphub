use adw::prelude::*;

use crate::application::ApphubApplication;

mod imp {
    use adw::prelude::*;
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    use crate::views::ApphubAppPage;
    use crate::views::ApphubHomePage;

    static HOME_VIEW_TAG: &str = "home_view";

    static HOME_PAGE_TAG: &str = "home_page";

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
            let home_page = adw::NavigationPage::builder()
                .title("Explore")
                .child(&ApphubHomePage::new())
                .tag(HOME_PAGE_TAG)
                .build();

            self.view_stack.add_titled_with_icon(
                &self.nav_stack.get(),
                Some(HOME_VIEW_TAG),
                "Explore",
                "compass-symbolic",
            );

            self.nav_stack.push(&home_page);



            // Connect signals
            self.back_btn.connect_clicked({
                let nav_stack = self.nav_stack.get();
                move |_| {
                    nav_stack.pop();
                }
            });
            self.nav_stack.connect_visible_page_notify({
                let btn = self.back_btn.get();
                move |nav_stack| {
                    let page = nav_stack.visible_page().unwrap();
                    if page.tag().unwrap_or_default().to_string() == HOME_PAGE_TAG {
                        btn.set_visible(false);
                    } else {
                        btn.set_visible(true);
                    }
                }
            });

            // Setup actions
            let visit_action = gio::SimpleAction::new(
                "navigator.visit",
                Some(&glib::VariantType::new("s").unwrap()),
            );


            visit_action.connect_activate({
                let nav_stack = self.nav_stack.get();
                move |_, parameter| {
                    let url = parameter.unwrap().get::<String>().unwrap();
                    let parts = url.split('/').collect::<Vec<&str>>();
                    match parts[1] {
                        "app" => {
                            let app_id = parts[2];
                            let app_page = ApphubAppPage::new(app_id);
                            let app_page = adw::NavigationPage::builder().child(&app_page).build();
                            nav_stack.push(&app_page);
                        }
                        _ => {
                            nav_stack.pop_to_page(&home_page);
                        }
                    }
                }
            });

            self.obj().add_action(&visit_action);

        }
    }
    impl ApplicationWindowImpl for ApphubWindow {}
    impl AdwApplicationWindowImpl for ApphubWindow {

    }
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
}
