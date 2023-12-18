use crate::{flathub_client::AppHit, image::load_image};
use glib::{subclass::types::ObjectSubclassIsExt, Variant};
use gtk::prelude::*;

mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/app_card.blp")]
    pub struct ApphubAppCard {
        #[template_child]
        pub name_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub description_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub image: TemplateChild<gtk::Image>,
        #[template_child]
        pub verified_box: TemplateChild<gtk::Box>,
        #[template_child]
        pub verified_label: TemplateChild<gtk::Label>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppCard {
        const NAME: &'static str = "ApphubAppCard";
        type Type = super::ApphubAppCard;
        type ParentType = gtk::Button;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppCard {}
    impl WidgetImpl for ApphubAppCard {}
    impl ButtonImpl for ApphubAppCard {}
}

glib::wrapper! {
    pub struct ApphubAppCard(ObjectSubclass<imp::ApphubAppCard>)
    @extends gtk::Button, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget, gtk::Actionable;
}

impl ApphubAppCard {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    pub fn load_from_hit(&self, app: AppHit) {
        let ui = self.imp();
        ui.name_label.set_text(&app.name);
        ui.description_label.set_text(&app.summary);

        ui.image.set_from_icon_name(Some("image-missing"));
        self.set_action_name(Some("win.navigator.visit"));
        self.set_action_target_value(Some(&Variant::from(format!("/app/{}", &app.app_id))));
        if let Some(icon) = app.icon.as_ref() {
            load_image(icon, &ui.image);
        }
        // BUG: After navigation to a new page the button is staying focused
        // preventing the user from scrolling with the mouse wheel.
        self.set_focus_on_click(false);
    }
}
