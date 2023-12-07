use crate::prelude::*;
#[derive(GtkWidget, Clone)]
#[allow(unused)]
struct Template {
    root: gtk::Box,
    content: gtk::Box,
    carousel: adw::Carousel,
    carousel_indicator: adw::CarouselIndicatorDots,
}

pub fn screenshots_caracal(screenshots: &Vec<flathub::Screenshot>) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/screenshots_caracal.blp");
    for screenshot in screenshots {
        if let Some(url) = &screenshot.sizes._624x351 {
            let image = gtk::Image::new();
            image.set_hexpand(true);
            image.set_vexpand(true);
            ui.carousel.append(&image);
            widgets::image(url, &image);
        }
    }

    return ui.root;
}
