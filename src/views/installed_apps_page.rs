use adw::prelude::*;
use adw::subclass::prelude::*;
use gtk::CompositeTemplate;

mod imp {

    use gtk::Widget;

    use crate::{models::InstalledApp, state::Context, widgets::AppCard};

    use super::*;

    #[derive(Debug, Default, CompositeTemplate)]
    #[template(file = "src/views/installed_apps_page.blp")]
    pub struct InstalledAppsPage {
        #[template_child]
        pub apps_list_box: TemplateChild<gtk::ListBox>,
        #[template_child]
        pub runtime_list_box: TemplateChild<gtk::ListBox>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for InstalledAppsPage {
        const NAME: &'static str = "ApphubInstalledAppsPage";
        type Type = super::InstalledAppsPage;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
            klass.bind_template_callbacks();
        }

        fn instance_init(obj: &glib::subclass::InitializingObject<Self>) {
            obj.init_template();
        }
    }

    #[gtk::template_callbacks]
    impl InstalledAppsPage {
        fn build_row(object: &glib::Object) -> Widget {
            let data = object.downcast_ref::<InstalledApp>().unwrap();
            let is_dup = Context::default()
                .installed_apps()
                .is_duplicate(&data.app_id());
            let ui = AppCard::new();
            if let Some(icon) = data.icon() {
                ui.set_icon_file(icon);
            }
            ui.set_name(data.name());
            if let Some(summery) = data.summary() {
                ui.set_description(summery);
            }
            if is_dup {
                ui.set_install_location(data.install_location());
            }
            return ui.upcast();
        }
    }

    impl ObjectImpl for InstalledAppsPage {
        fn constructed(&self) {
            self.parent_constructed();
            let context = Context::default();
            let list_model = context.installed_apps();

            // ListBox has a builtin filter function but the callback it needs dose not have
            // a parameter for the item this looks to be a issue with the rust bindings
            // so we use a custom filter instead
            let apps_model = gtk::SortListModel::builder()
                .sorter(&gtk::CustomSorter::new(|a, b| {
                    let a = a.downcast_ref::<InstalledApp>().unwrap();
                    let b = b.downcast_ref::<InstalledApp>().unwrap();
                    match a.name().cmp(&b.name()) {
                        std::cmp::Ordering::Equal => gtk::Ordering::Equal,
                        std::cmp::Ordering::Less => gtk::Ordering::Smaller,
                        std::cmp::Ordering::Greater => gtk::Ordering::Larger,
                    }
                }))
                .model(
                    &gtk::FilterListModel::builder()
                        .filter(&gtk::CustomFilter::new(|item| {
                            let app = item.downcast_ref::<InstalledApp>().unwrap();
                            app.ref_path().starts_with("app")
                        }))
                        .model(&list_model)
                        .build(),
                )
                .build();

            let runtime_model = gtk::SortListModel::builder()
                .sorter(&gtk::CustomSorter::new(|a, b| {
                    let a = a.downcast_ref::<InstalledApp>().unwrap();
                    let b = b.downcast_ref::<InstalledApp>().unwrap();
                    match a.name().cmp(&b.name()) {
                        std::cmp::Ordering::Equal => gtk::Ordering::Equal,
                        std::cmp::Ordering::Less => gtk::Ordering::Smaller,
                        std::cmp::Ordering::Greater => gtk::Ordering::Larger,
                    }
                }))
                .model(
                    &gtk::FilterListModel::builder()
                        .filter(&gtk::CustomFilter::new(|item| {
                            let app = item.downcast_ref::<InstalledApp>().unwrap();
                            app.ref_path().starts_with("runtime")
                                && !app.app_id().ends_with(".Locale")
                                && !app.app_id().ends_with(".Devel")
                        }))
                        .model(&list_model)
                        .build(),
                )
                .build();

            self.apps_list_box
                .bind_model(Some(&apps_model), Self::build_row);
            self.runtime_list_box
                .bind_model(Some(&runtime_model), Self::build_row);
        }
    }

    impl WidgetImpl for InstalledAppsPage {}
    impl BinImpl for InstalledAppsPage {}
}

glib::wrapper! {
    pub struct InstalledAppsPage(ObjectSubclass<imp::InstalledAppsPage>)
        @extends gtk::Widget, adw::Bin;
}

impl InstalledAppsPage {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }
}

