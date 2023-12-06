mod flathub;
mod utils;
mod widgets;
mod flatbus;
mod event_bus;

use adw::prelude::*;
use gtk::gdk;
use gtk::gio;
use gtk::glib;
use utils::resource_path;

use crate::utils::APP_ID;

fn main() {
    let app = adw::Application::new(Some(APP_ID), Default::default());
    app.connect_activate(active);
    app.run();
}

#[allow(deprecated)]
fn setup_resources() {
    gio::resources_register_include!("compiled.gresource").expect("Failed to register resources");
    let display = gdk::Display::default().expect("Cannot get display");
    let icon_theme = gtk::IconTheme::for_display(&display);
    icon_theme.add_resource_path(&resource_path("icons"));
    let provider = gtk::CssProvider::new();
    provider.load_from_bytes(&glib::Bytes::from_static(include_bytes!("styles.css")));
    gtk::StyleContext::add_provider_for_display(
        &display,
        &provider,
        gtk::STYLE_PROVIDER_PRIORITY_APPLICATION,
    );
}

pub fn active(app: &adw::Application) {
    setup_resources();

    let window = widgets::window(app);
    window.present();
}
