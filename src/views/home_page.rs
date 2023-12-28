use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::CompositeTemplate;

use crate::{utils::call_me_maybe, widgets::AppCard};
use flathub_rs::AppHit;
use gtk::prelude::*;

mod imp {

    use super::*;
    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/views/home_page.blp")]
    pub struct ApphubHomePage {
        #[template_child]
        pub root: TemplateChild<gtk::ScrolledWindow>,
        #[template_child]
        pub recently_added_box: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub recently_updated_box: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub popular_box: TemplateChild<gtk::FlowBox>,
        // #[template_child]
        // pub popular_btn: TemplateChild<gtk::Button>,
        // #[template_child]
        // pub recently_added_btn: TemplateChild<gtk::Button>,
        // #[template_child]
        // pub recently_updated_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub stack: TemplateChild<gtk::Stack>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubHomePage {
        const NAME: &'static str = "ApphubHomePage";
        type Type = super::ApphubHomePage;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubHomePage {
        fn constructed(&self) {
            fn load_grid(grid: &gtk::FlowBox, data: &Vec<AppHit>) {
                for app in data {
                    let app_widget = AppCard::new();
                    app_widget.set_description(app.summary.to_string());
                    app_widget.set_icon_url(app.icon.to_string());
                    app_widget.set_name(app.name.to_string());

                    let app_widget = adw::Clamp::builder()
                        .child(&app_widget)
                        .orientation(gtk::Orientation::Horizontal)
                        .maximum_size(400)
                        .halign(gtk::Align::Start)
                        .hexpand(true)
                        .build();

                    let btn = gtk::Button::builder()
                        .child(&app_widget)
                        .css_classes(vec!["card"])
                        .action_name("win.navigator.visit")
                        .action_target(&format!("/app/{}", app.app_id).to_variant())
                        .build();

                    let child = gtk::FlowBoxChild::builder()
                        .child(&btn)
                        .width_request(400)
                        .height_request(80)
                        .halign(gtk::Align::Fill)
                        .hexpand(true)
                        .valign(gtk::Align::Fill)
                        .build();

                    grid.append(&child);
                }
            }
            call_me_maybe(async { flathub_rs::home_page(12).await }, {
                let recently_added_box = self.recently_added_box.clone();
                let recently_updated_box = self.recently_updated_box.clone();
                let popular_box = self.popular_box.clone();
                let stack = self.stack.clone();
                let root = self.root.clone();
                move |data| {
                    if let Ok(data) = data {
                        load_grid(&recently_added_box, &data.new_apps);
                        load_grid(&recently_updated_box, &data.updated_apps);
                        load_grid(&popular_box, &data.popular_apps);
                        stack.set_visible_child(&root);
                    }
                }
            });
        }
    }

    impl WidgetImpl for ApphubHomePage {}
    impl BinImpl for ApphubHomePage {}
}

glib::wrapper! {
    pub struct ApphubHomePage(ObjectSubclass<imp::ApphubHomePage>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}

impl ApphubHomePage {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }
}
