pub mod flathub;
pub mod backend;
pub mod prelude;
pub mod utils;
pub mod widgets;

use crate::prelude::*;

fn main() {
    let app = adw::Application::new(Some(APP_ID), Default::default());
    app.connect_activate(active);
    app.run();
}

#[allow(deprecated)]
fn setup_resources() {
    gio::resources_register_include!("compiled.gresource")
        .expect(&tr!("Failed to register resources"));
    let display = gdk::Display::default().expect(&tr!("Cannot get display"));
    let icon_theme = gtk::IconTheme::for_display(&display);
    icon_theme.add_resource_path(&format!("{}/icons", RESOURCE_PATH));
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
