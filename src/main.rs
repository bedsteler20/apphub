#![feature(associated_type_defaults)]

mod application;
mod config;
mod error;
mod models;
mod state;
mod utils;
mod views;
mod widgets;
mod router;

use application::ApphubApplication;
use gio::prelude::ApplicationExt;
use glib::StaticTypeExt;
use gtk::gdk;
use router::Router;
use utils::configure_http;


fn main() -> glib::ExitCode {
    configure_http();
    register_types();
    let app = ApphubApplication::new();
    app.connect_activate(|_app| register_resource());
    app.run()
}

fn register_resource() {
    gio::resources_register_include!("compiled.gresource").expect("Failed to register resources");
    let display = gdk::Display::default().expect("Cannot get display");
    let icon_theme = gtk::IconTheme::for_display(&display);
    icon_theme.add_resource_path("/dev/bedsteler20/Apphub/icons");
    let provider = gtk::CssProvider::new();
    provider.load_from_string(include_str!("styles.less"));
    gtk::style_context_add_provider_for_display(
        &gdk::Display::default().expect("Could not connect to a display."),
        &provider,
        gtk::STYLE_PROVIDER_PRIORITY_APPLICATION,
    );
}

fn register_types() {
    // widgets
    widgets::ApphubAppLinks::ensure_type();
    widgets::ApphubInstallBtn::ensure_type();
    widgets::AppCard::ensure_type();

    // views
    views::ApphubAppPage::ensure_type();
    views::ApphubHomePage::ensure_type();
    views::ApphubWindow::ensure_type();
    views::InstalledAppsPage::ensure_type();
    views::UpdatesAppsPage::ensure_type();
    views::ErrorPage::ensure_type();

    // enums
    models::TransactionType::ensure_type();
    models::InstallLocation::ensure_type();

    // models
    models::ApphubTransaction::ensure_type();

    // state
    state::UpdatesList::ensure_type();
    state::InstalledAppsList::ensure_type();
    state::TransactionList::ensure_type();
    state::Context::ensure_type();

    // application
    ApphubApplication::ensure_type();
    Router::ensure_type();
}
