mod flathub;
mod navigator;
mod utils;
mod widgets;

use adw::prelude::*;
use gtk::gio;
use gtk::glib;

use crate::utils::APP_ID;

fn main() {
    gio::resources_register_include!("compiled.gresource").expect("Failed to register resources");
    let app = adw::Application::new(Some(APP_ID), Default::default());
    app.connect_activate(active);
    app.run();
}

#[allow(deprecated)]
fn setup_resources() {
    let icon_theme = gtk::IconTheme::default();
    icon_theme.add_resource_path("/dev/bedsteler20/AppHub/icons/");
    let provider = gtk::CssProvider::new();
    provider.load_from_bytes(&glib::Bytes::from_static(include_bytes!("styles.css")));
    gtk::StyleContext::add_provider_for_display(
        &gtk::gdk::Display::default().unwrap(),
        &provider,
        gtk::STYLE_PROVIDER_PRIORITY_APPLICATION,
    )
}

pub fn active(app: &adw::Application) {
    setup_resources();
    let window = widgets::window(app);
    window.present();
}
