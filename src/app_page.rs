use crate::screenshots_caracal::ApphubScreenshotCaracal;
use crate::{flathub_client::AppInfo, image::load_image};
use crate::prelude::*;
use glib::subclass::types::{ObjectSubclassExt, ObjectSubclassIsExt};

mod imp {
    use std::cell::RefCell;

    use adw::subclass::prelude::*;
    use glib::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    use crate::data_loader::get_app_page_data;

    #[derive(CompositeTemplate, Default, glib::Properties)]
    #[template(file = "src/app_page.blp")]
    #[properties(wrapper_type = super::ApphubAppPage)]
    pub struct ApphubAppPage {
        #[template_child]
        pub icon: TemplateChild<gtk::Image>,
        #[template_child]
        pub name_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub dev_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub install_btn_container: TemplateChild<adw::Bin>,
        #[template_child]
        pub caracal_container: TemplateChild<adw::Clamp>,
        #[template_child]
        pub summary_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub description_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub app_links: TemplateChild<adw::Bin>,
        #[template_child]
        pub root: TemplateChild<gtk::ScrolledWindow>,
        #[property(get, set)]
        pub app_id: RefCell<String>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppPage {
        const NAME: &'static str = "ApphubAppPage";
        type Type = super::ApphubAppPage;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    #[glib::derived_properties]
    impl ObjectImpl for ApphubAppPage {
        fn constructed(&self) {
            self.parent_constructed();
            self.obj().connect_app_id_notify(|this| {
                let app_id = this.app_id();
                get_app_page_data(&app_id, {
                    let this = this.clone();
                    move |data| {
                        if let Ok(data) = data {
                            this.load_data(data);
                        } else if let Err(err) = data {
                            println!("Failed to load app page data {}", err);
                        }
                    }
                });
            });
        }
    }
    impl WidgetImpl for ApphubAppPage {}
    impl BinImpl for ApphubAppPage {}
}

glib::wrapper! {
    pub struct ApphubAppPage(ObjectSubclass<imp::ApphubAppPage>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}

impl ApphubAppPage {
    pub fn new(app_id: &str) -> Self {
        glib::Object::builder().property("app-id", app_id).build()
    }

    pub fn load_data(&self, data: AppInfo) {
        let imp = self.imp();
        imp.name_label.set_text(&data.name);
        if let Some(developer_name) = data.developer_name {
            imp.dev_label.set_text(&developer_name);
        } else {
            imp.dev_label.set_text("Unknown developer");
        }

        if let Some(summary) = data.summary {
            imp.summary_label.set_text(&summary);
        } else {
            imp.summary_label.set_text("No summary available");
        }

        if let Some(description) = data.description {
            imp.description_label
                .set_text(&format_description(description));
        } else {
            imp.description_label.set_text("No description available");
        }

        if let Some(icon) = data.icon {
            load_image(&icon, &imp.icon);
        }

        if let Some(screenshots) = data.screenshots {
            let caracal = ApphubScreenshotCaracal::new();
            imp.caracal_container.set_child(Some(&caracal));
            caracal.load_data(screenshots);
        }



        // Replace the loading spinner with the page
        imp.obj().set_child(Some(&imp.root.get()));
    }
}

fn format_description(description: String) -> String {
    description
        .replace("\n", "<br/>")
        .replace("<p>", "")
        .replace("</p>", "\n")
        .replace("<ul>", "\n")
        .replace("</ul>", "")
        .replace("<li>", " - ")
        .replace("</li>", "\n")
}
