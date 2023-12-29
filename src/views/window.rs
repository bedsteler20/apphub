use adw::prelude::*;
use glib::subclass::types::ObjectSubclassIsExt;

use crate::application::ApphubApplication;
use adw::prelude::*;
use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::CompositeTemplate;

use crate::views::ApphubAppPage;
use crate::views::ApphubHomePage;
use crate::views::InstalledAppsPage;
use crate::views::UpdatesAppsPage;
mod imp {
    use super::*;

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
        #[template_child]
        pub home_page: TemplateChild<ApphubHomePage>,
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
                .child(&self.home_page.get())
                .tag(HOME_PAGE_TAG)
                .build();

            self.nav_stack.push(&home_page);

            // Connect signals
            self.view_stack.connect_visible_child_notify({
                let obj = self.obj().clone();
                move |view_stack| {
                    let visible_child = view_stack.visible_child_name().unwrap();
                    let tag = visible_child.as_str();
                   println!("tag: {}", tag);
                    match tag {
                        "home_page" => obj.navigate_to("/home", true),
                        "installed_page" => obj.navigate_to("/installed",true),
                        "updates_page" => obj.navigate_to("/updates", true),
                        _ => obj.navigate_to("/home", true),
                    }
                }
            });

            self.back_btn.connect_clicked({
                let nav_stack = self.nav_stack.get();
                move |_| {
                    nav_stack.pop();
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

            // Setup actions
            let visit_action = gio::SimpleAction::new(
                "navigator.visit",
                Some(&glib::VariantType::new("s").unwrap()),
            );

            visit_action.connect_activate({
                let obj = self.obj().clone();
                move |_, parameter| {
                    let url = parameter.unwrap().get::<String>().unwrap();
                    obj.navigate_to(&url, false);
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

    fn navigate_to(&self, url: &str, replace_all: bool) {
        let parts = url.split('/').collect::<Vec<&str>>();
        let nav_stack = self.imp().nav_stack.get();
        let page = match parts[1] {
            "home" => {
                let home_page = self.imp().home_page.get();
                let home_page = adw::NavigationPage::builder()
                    .tag("home_page")
                    .child(&home_page)
                    .build();
                home_page
            }
            "installed" => {
                println!("Installed apps");
                let installed_page = InstalledAppsPage::new();
                let installed_page = adw::NavigationPage::builder()
                    .child(&installed_page)
                    .tag("installed_page")
                    .build();
                installed_page
            }
            "updates" => {
                let updates_page = UpdatesAppsPage::new();
                let updates_page = adw::NavigationPage::builder()
                    .child(&updates_page)
                    .tag("updates_page")
                    .build();
                updates_page
            }
            "app" => {
                let app_id = parts[2];
                let app_page = ApphubAppPage::new(app_id);
                let app_page = adw::NavigationPage::builder().child(&app_page).build();
                app_page
            }
            _ => {
                let home_page = self.imp().home_page.get();
                let home_page = adw::NavigationPage::builder().child(&home_page).build();
                home_page
            }
        };

        if replace_all {
            nav_stack.replace(&[page]);
        } else {
            nav_stack.push(&page);
        }
    }
}
