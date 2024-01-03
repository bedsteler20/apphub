use glib::{subclass::types::ObjectSubclassIsExt, ToVariant};
use gtk::prelude::ActionableExt;
use gtk::prelude::*;

use adw::subclass::prelude::*;
use glib::subclass::InitializingObject;
use gtk::CompositeTemplate;
use tr::tr;
mod imp {
    use super::*;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/widgets/app_links.blp")]
    pub struct ApphubAppLinks {
        #[template_child]
        pub flow: TemplateChild<gtk::FlowBox>,
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

    fn build_card(
        &self,
        label: &str,
        icon_name: &str,
        url: Option<&str>,
        description: Option<&str>,
    ) {
        let h_box = gtk::Box::builder()
            .orientation(gtk::Orientation::Horizontal)
            .margin_top(12)
            .margin_bottom(12)
            .margin_start(12)
            .margin_end(12)
            .spacing(10)
            .build();

        let icon = gtk::Image::builder()
            .icon_size(gtk::IconSize::Large)
            .icon_name(icon_name)
            .build();

        let v_box = gtk::Box::builder()
            .orientation(gtk::Orientation::Vertical)
            .hexpand(true)
            .build();

        let title_widget = gtk::Label::builder()
            .label(label)
            .halign(gtk::Align::Start)
            .wrap(true)
            .overflow(gtk::Overflow::Hidden)
            .css_classes(vec!["heading"])
            .build();

        let description_widget = gtk::Label::builder()
            .label(description.unwrap_or(url.unwrap_or(&tr!("No description provided"))))
            .halign(gtk::Align::Start)
            .wrap(true)
            .overflow(gtk::Overflow::Hidden)
            .css_classes(vec!["caption"])
            .hexpand(true)
            .max_width_chars(50)
            .build();

        h_box.append(&icon);
        h_box.append(&v_box);
        v_box.append(&title_widget);
        v_box.append(&description_widget);

        if url.is_some() {
            h_box.append(
                &gtk::Image::builder()
                    .icon_name("adw-external-link-symbolic")
                    .build(),
            );
        }

        if let Some(url) = url {
            let root = gtk::Button::builder().css_classes(vec!["card"]).build();
            root.set_child(Some(&h_box));
            root.set_action_name(Some("app.open-url"));
            root.set_action_target_value(Some(&url.to_variant()));
            self.imp().flow.append(&root);
        } else {
            let root = gtk::Box::builder().css_classes(vec!["card"]).build();
            root.append(&h_box);
            self.imp().flow.append(&root);
        }
    }

    pub fn load_data(&self, data: &flathub_rs::Appstream) {
        if let Some(links) = data.urls.as_ref() {
            if let Some(bug_tracker) = links.bug_tracker.as_ref() {
                self.build_card(&tr!("Report an Issue"), "bug-symbolic", Some(&bug_tracker), None);
            }

            if let Some(contribute) = links.contribute.as_ref() {
                self.build_card(&tr!("Contribute"), "merge-symbolic", Some(&contribute), None);
            }

            if let Some(donation) = links.donation.as_ref() {
                self.build_card(&tr!("Donate"), "heart-filled-symbolic", Some(&donation), None);
            }

            if let Some(help) = links.help.as_ref() {
                self.build_card(&tr!("Help"), "open-book-symbolic", Some(&help), None);
            }

            if let Some(translate) = links.translate.as_ref() {
                self.build_card(
                    &tr!("Contribute Translation"),
                    "language-symbolic",
                    Some(&translate),
                    None,
                );
            }

            if let Some(homepage) = links.homepage.as_ref() {
                self.build_card(&tr!("Homepage"), "globe-symbolic", Some(&homepage), None);
            }

            if let Some(vcs_browser) = links.vcs_browser.as_ref() {
                self.build_card(&tr!("Source Code"), "git-symbolic", Some(&vcs_browser), None);
            }

            if let Some(contact) = links.contact.as_ref() {
                // cspell: disable-next-line
                self.build_card(
                    "Contact",
                    "chat-bubble-emtpy-symbolic",
                    Some(&contact),
                    None,
                );
            }

            if let Some(faq) = links.faq.as_ref() {
                self.build_card(&tr!("FAQ"), "about-symbolic", Some(&faq), None);
            }
        }

        if let Some(license) = data.project_license.as_ref() {
            self.build_card(&tr!("License"), "bank-symbolic", None, Some(&license));
        }

        self.build_card(
            &tr!("Manifest"),
            "code-symbolic",
            Some(&format!("https://github.com/flathub/{}", data.id)),
            None,
        );
    }
}
