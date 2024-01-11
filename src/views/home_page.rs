use crate::utils::{call_me_maybe, Findable};
use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::prelude::*;
use gtk::CompositeTemplate;

mod imp {

    use crate::{utils::load_grid, views::ApphubWindow};

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
        #[template_child]
        pub popular_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub recently_added_btn: TemplateChild<gtk::Button>,
        #[template_child]
        pub recently_updated_btn: TemplateChild<gtk::Button>,
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
            self.parent_constructed();
            self.popular_btn.set_action_name(Some("navigation.visit"));
            self.recently_added_btn
                .set_action_name(Some("navigation.visit"));
            self.recently_updated_btn
                .set_action_name(Some("navigation.visit"));
            self.popular_btn
                .set_action_target(Some("/pager/popular/1".to_variant()));
            self.recently_added_btn
                .set_action_target(Some("/pager/new-apps/1".to_variant()));
            self.recently_updated_btn
                .set_action_target(Some("/pager/recently-updated/1".to_variant()));

            call_me_maybe(async { flathub_rs::home_page(12).await }, {
                let recently_added_box = self.recently_added_box.clone();
                let recently_updated_box = self.recently_updated_box.clone();
                let popular_box = self.popular_box.clone();
                let stack = self.stack.clone();
                let root = self.root.clone();
                move |data| {
                    if let Ok(data) = data {
                        load_grid(&recently_added_box, &data.new_aperrr>(e.into());
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

impl rose::PageRoute for ApphubHomePage {
    type Parameter = ();
    fn route() -> &'static str {
        "home"
    }

    fn is_top_level() -> bool {
        true
    }

    fn is_static() -> bool {
        true
    }

    fn build(_parameter: Option<Self::Parameter>) -> impl IsA<gtk::Widget> {
        Self::new()
    }
}
