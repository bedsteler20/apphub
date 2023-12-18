mod imp {
    use adw::prelude::BinExt;
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::prelude::*;
    use gtk::CompositeTemplate;

    use crate::app_card::ApphubAppCard;
    use crate::data_loader::get_home_page_data;
    use crate::flathub_client::AppHit;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/home_page.blp")]
    pub struct ApphubHomePage {
        #[template_child]
        pub root: TemplateChild<gtk::ScrolledWindow>,
        #[template_child]
        pub recently_added_box: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub recently_updated_box: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub popular_box: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub popular_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub recently_added_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub recently_updated_btn: TemplateChild<gtk::Button>,
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
            fn load_grid(grid: &gtk::FlowBox, data: Vec<AppHit>) {
                for app in data {
                    let app_widget = ApphubAppCard::new();
                    app_widget.load_from_hit(app);
                    grid.append(&app_widget);
                }
            }

            get_home_page_data({
                let popular_grid = self.popular_box.clone();
                let recently_added_grid = self.recently_added_box.clone();
                let recently_updated_grid = self.recently_updated_box.clone();
                let root = self.root.clone();
                let obj = self.obj().clone();
                move |result| {
                    if let Ok(data) = result {
                        load_grid(&popular_grid, data.popular);
                        load_grid(&recently_added_grid, data.recently_added);
                        load_grid(&recently_updated_grid, data.recently_updated);
                        obj.set_child(Some(&root));
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
