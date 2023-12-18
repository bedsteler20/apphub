use glib::subclass::types::ObjectSubclassIsExt;
use gtk::prelude::WidgetExt;

use crate::{flathub_client::Screenshot, image::load_image};

mod imp {
    use adw::subclass::prelude::*;
    use glib::subclass::InitializingObject;
    use gtk::CompositeTemplate;

    #[derive(CompositeTemplate, Default)]
    #[template(file = "src/screenshots_caracal.blp")]
    pub struct ApphubScreenshotCaracal {
        #[template_child]
        pub content: TemplateChild<gtk::Box>,
        #[template_child]
        pub carousel: TemplateChild<adw::Carousel>,
        #[template_child]
        pub carousel_indicator: TemplateChild<adw::CarouselIndicatorDots>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubScreenshotCaracal {
        const NAME: &'static str = "ApphubScreenshotCaracal";
        type Type = super::ApphubScreenshotCaracal;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            klass.bind_template();
        }

        fn instance_init(obj: &InitializingObject<Self>) {
            obj.init_template();
        }
    }

    impl ObjectImpl for ApphubScreenshotCaracal {}
    impl WidgetImpl for ApphubScreenshotCaracal {}
    impl BinImpl for ApphubScreenshotCaracal {}
}

glib::wrapper! {
    pub struct ApphubScreenshotCaracal(ObjectSubclass<imp::ApphubScreenshotCaracal>)
        @extends adw::Bin, gtk::Widget,
        @implements gtk::Accessible, gtk::Buildable,
                    gtk::ConstraintTarget;
}


impl ApphubScreenshotCaracal {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    pub fn load_data(&self, screenshots: Vec<Screenshot>) {
        let imp = self.imp();
        for screenshot in screenshots {
            if let Some(url) = screenshot.sizes._624x351 {
                // TODO: use gtk::Picture instead of gtk::Image
                let pic = gtk::Image::new();
                // pic.set_content_fit(gtk::ContentFit::Fill);
                load_image(&url, &pic);
                pic.set_vexpand(true);
                pic.set_hexpand(true);
                pic.set_margin_top(15);
                pic.set_margin_bottom(15);
                imp.carousel.append(&pic);
            }
        }
        
    }
}