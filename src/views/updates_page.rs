use adw::prelude::*;
use adw::subclass::prelude::*;
use gtk::CompositeTemplate;

use crate::router::Route;

mod imp {

    use gtk::Widget;

    use crate::{
        models::InstalledApp, state::Context, utils::Findable, views::ApphubWindow,
        widgets::AppCard,
    };

    use super::*;

    #[derive(Debug, Default, CompositeTemplate)]
    #[template(file = "src/views/updates_page.blp")]
    pub struct UpdatesAppsPage {
        #[template_child]
        pub apps_list_box: TemplateChild<gtk::ListBox>,
        #[template_child]
        pub runtime_list_box: TemplateChild<gtk::ListBox>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for UpdatesAppsPage {
        const NAME: &'static str = "ApphubUpdatesAppsPage";
        type Type = super::UpdatesAppsPage;
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
    impl UpdatesAppsPage {
        fn build_row(object: &glib::Object) -> Widget {
            let data = object.downcast_ref::<InstalledApp>().unwrap();
            let ui = AppCard::new();
            if let Some(icon) = data.icon() {
                ui.set_icon_file(icon);
            }
            ui.set_name(data.name());
            if let Some(summery) = data.summary() {
                ui.set_description(summery);
            }
            return ui.upcast();
        }
    }

    impl ObjectImpl for UpdatesAppsPage {
        fn constructed(&self) {
            self.parent_constructed();
            let context = Context::default();
            let list_model = context.updates();

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

            self.apps_list_box.connect_row_activated({
                let apps = apps_model.clone();
                move |_, row| {
                    let item = apps.item(row.index() as u32).unwrap();
                    let app = item.downcast_ref::<InstalledApp>().unwrap();
                    // TODO fix this
                    // ApphubWindow::find().navigate_to(&format!("/app/{}", app.app_id()));
                }
            });

            self.runtime_list_box.connect_row_activated({
                let apps = runtime_model.clone();
                move |_, row| {
                    let item = apps.item(row.index() as u32).unwrap();
                    let app = item.downcast_ref::<InstalledApp>().unwrap();
                    // TODO fix this
                    // ApphubWindow::find().navigate_to(&format!("/app/{}", app.app_id()));
                }
            });

            self.apps_list_box
                .bind_model(Some(&apps_model), Self::build_row);
            self.runtime_list_box
                .bind_model(Some(&runtime_model), Self::build_row);
        }
    }

    impl WidgetImpl for UpdatesAppsPage {}
    impl BinImpl for UpdatesAppsPage {}
}

glib::wrapper! {
    pub struct UpdatesAppsPage(ObjectSubclass<imp::UpdatesAppsPage>)
        @extends gtk::Widget, adw::Bin;
}

impl UpdatesAppsPage {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }
}

impl Route for UpdatesAppsPage {
    fn route() -> &'static str {
        "updates"
    }

    fn is_top_level() -> bool {
        true
    }

    fn is_static() -> bool {
        false
    }

    fn build(_: Option<Self::Parameter>) -> impl IsA<gtk::Widget> {
        Self::new()
    }
}