use glib::{subclass::types::ObjectSubclassIsExt, ToVariant};
use gtk::prelude::ActionableExt;

mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/widgets/app_links.blp")]
    pub struct ApphubAppLinks {
        #[template_child]
        pub flow: TemplateChild<gtk::FlowBox>,
        #[template_child]
        pub install_size_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub install_size_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub download_size_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub download_size_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub arch_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub arch_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub license_card: TemplateChild<gtk::Box>,
        #[template_child]
        pub license_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub website_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub website_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub issues_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub issues_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub contribute_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub contribute_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub help_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub help_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub translate_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub translate_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub donate_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub donate_label: TemplateChild<gtk::Label>,
        #[template_child]
        pub manifest_card: TemplateChild<gtk::Button>,
        #[template_child]
        pub manifest_label: TemplateChild<gtk::Label>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppLinks {
        const NAME: &'static str = "ApphubAppLinks";
        type Type = super::ApphubAppLinks;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubAppLinks {}
    impl WidgetImpl for ApphubAppLinks {}
    impl BinImpl for ApphubAppLinks {}
}

glib::wrapper! {
    pub struct ApphubAppLinks(ObjectSubclass<imp::ApphubAppLinks>)
    @extends adw::Bin, gtk::Widget,
    @implements gtk::Accessible, gtk::Buildable,
                gtk::ConstraintTarget;
}

impl ApphubAppLinks {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    pub fn load_data(&self, data: &flathub_rs::Appstream) {
        let imp = self.imp();
        if let Some(links) = data.urls.as_ref() {
            if let Some(bug_tracker) = links.bug_tracker.as_ref() {
                imp.issues_label.set_text(bug_tracker);
                imp.flow.append(&imp.issues_card.get());
                imp.issues_card.set_action_name(Some("app.open-url"));
                imp.issues_card
                    .set_action_target_value(Some(&bug_tracker.to_variant()));
            }

            if let Some(contribute) = links.contribute.as_ref() {
                imp.contribute_label.set_text(contribute);
                imp.flow.append(&imp.contribute_card.get());
                imp.contribute_card.set_action_name(Some("app.open-url"));
                imp.contribute_card
                    .set_action_target_value(Some(&contribute.to_variant()));
            }

            if let Some(donation) = links.donation.as_ref() {
                imp.donate_label.set_text(donation);
                imp.flow.append(&imp.donate_card.get());
                imp.donate_card.set_action_name(Some("app.open-url"));
                imp.donate_card
                    .set_action_target_value(Some(&donation.to_variant()));
            }

            if let Some(help) = links.help.as_ref() {
                imp.help_label.set_text(help);
                imp.flow.append(&imp.help_card.get());
                imp.help_card.set_action_name(Some("app.open-url"));
                imp.help_card
                    .set_action_target_value(Some(&help.to_variant()));
            }

            if let Some(translate) = links.translate.as_ref() {
                imp.translate_label.set_text(translate);
                imp.flow.append(&imp.translate_card.get());
                imp.translate_card.set_action_name(Some("app.open-url"));
                imp.translate_card
                    .set_action_target_value(Some(&translate.to_variant()));
            }

            if let Some(homepage) = links.homepage.as_ref() {
                imp.website_label.set_text(homepage);
                imp.flow.append(&imp.website_card.get());
                imp.website_card.set_action_name(Some("app.open-url"));
                imp.website_card
                    .set_action_target_value(Some(&homepage.to_variant()));
            }

            //  TODO: add vcs_browser, contact  and faq
        }

        if let Some(license) = data.project_license.as_ref() {
            imp.license_label.set_text(license);
            imp.flow.append(&imp.license_card.get());
        }

        let url = format!("https://github.com/flathub/{}", data.id);
        imp.manifest_label.set_text(&url);
        imp.flow.append(&imp.manifest_card.get());
        imp.manifest_card.set_action_name(Some("app.open-url"));
        imp.manifest_card
            .set_action_target_value(Some(&url.to_variant()));
    }
}
