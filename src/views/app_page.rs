use glib::subclass::types::{ObjectSubclassExt, ObjectSubclassIsExt};
use gtk::prelude::*;

use std::cell::RefCell;

use crate::{
    utils::call_me_maybe,
    widgets::{ApphubAppLinks, ApphubInstallBtn},
};
use adw::prelude::*;
use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::CompositeTemplate;
use tr::tr;
mod imp {

    use super::*;
    #[derive(CompositeTemplate, Default, glib::Properties)]
    #[template(file = "src/views/app_page.blp")]
    #[properties(wrapper_type = super::ApphubAppPage)]
    pub struct ApphubAppPage {
        #[template_child]
        pub icon: TemplateChild<gtk::Image>,
        #[template_child]
        pub name_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub dev_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub install_btn: TemplateChild<ApphubInstallBtn>,
        #[template_child]
        pub summary_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub description_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub app_links: TemplateChild<ApphubAppLinks>,
        #[template_child]
        pub root: TemplateChild<gtk::ScrolledWindow>,
        #[template_child]
        pub carousel_indicator: TemplateChild<adw::CarouselIndicatorDots>,
        #[template_child]
        pub carousel: TemplateChild<adw::Carousel>,
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
                this.imp().install_btn.set_app_id(app_id.clone());
                call_me_maybe(async move { flathub_rs::appstream(&app_id).await }, {
                    let this = this.clone();
                    move |data| {
                        if let Ok(data) = data {
                            this.load_data(data);
                        } else if let Err(err) = data {
                            rose::show_error_page::<crate::error::Error>(err.into());
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

    pub fn load_data(&self, data: flathub_rs::Appstream) {
        let imp = self.imp();
        imp.name_label.set_text(&data.name);
        imp.install_btn.set_bundle(data.bundle.value.clone());
        if let Some(ref developer_name) = data.developer_name {
            imp.dev_label.set_text(&developer_name);
        } else {
            imp.dev_label.set_text(&tr!("Unknown developer"));
        }

        if let Some(ref summary) = data.summary {
            imp.summary_label.set_text(&summary);
        } else {
            imp.summary_label.set_text(&tr!("No summary available"));
        }

        if let Some(ref description) = data.description {
            imp.description_label
                .set_text(&format_description(description));
        } else {
            imp.description_label
                .set_text(&tr!("No description available"));
        }

        if let Some(ref icon) = data.icon {
            crate::widgets::load_image(&icon, &imp.icon);
        }

        if let Some(ref screenshots) = data.screenshots {
            for screenshot in screenshots {
                if let Some(ref url) = screenshot.sizes._624x351 {
                    // TODO: use gtk::Picture instead of gtk::Image
                    let pic = gtk::Picture::new();
                    crate::widgets::load_picture(&url, &pic);
                    pic.set_content_fit(gtk::ContentFit::Fill);
                    pic.set_margin_bottom(15);
                    pic.set_margin_top(15);
                    imp.carousel.append(&pic);
                }
            }
        }

        imp.app_links.load_data(&data);
        // Replace the loading spinner with the page
        imp.obj().set_child(Some(&imp.root.get()));
    }
}

impl rose::PageRoute for ApphubAppPage {
    type Parameter = String;
    fn route() -> &'static str {
        "app"
    }

    fn build(parameter: Option<Self::Parameter>) -> impl IsA<gtk::Widget> {
        let app_id = parameter.unwrap();
        ApphubAppPage::new(&app_id)
    }
}

fn format_description(description: &String) -> String {
    description
        .replace("\n", "<br/>")
        .replace("<p>", "")
        .replace("</p>", "\n")
        .replace("<ul>", "\n")
        .replace("</ul>", "")
        .replace("<li>", " - ")
        .replace("</li>", "\n")
}
