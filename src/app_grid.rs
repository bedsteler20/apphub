use glib::subclass::types::ObjectSubclassIsExt;

use crate::{flathub_client::AppHit, app_card::ApphubAppCard};

mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/app_grid.blp")]
    pub struct ApphubAppGrid {
        #[template_child]
        pub flow: TemplateChild<gtk::FlowBox>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppGrid {
        const NAME: &'static str = "ApphubAppGrid";
        type Type = super::ApphubAppGrid;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppGrid {}
    impl WidgetImpl for ApphubAppGrid {}
    impl BinImpl for ApphubAppGrid {}
}

glib::wrapper! {
    pub struct ApphubAppGrid(ObjectSubclass<imp::ApphubAppGrid>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}

impl ApphubAppGrid {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

   pub fn load_data(&self, apps: Vec<AppHit>) {
        for app in apps {
            let card = ApphubAppCard::new();
            card.load_from_hit(app);
            self.imp().flow.append(&card);
        }
    }
}

impl Default for ApphubAppGrid {
    fn default() -> Self {
        Self::new()
    }
}