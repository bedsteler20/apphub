mod application;
mod error;
mod models;
mod utils;
mod views;
mod widgets;

use application::ApphubApplication;
use glib::StaticTypeExt;

fn main() -> glib::ExitCode {
    register_types();
    let app = ApphubApplication::new();
    app.run()
}

fn register_types() {
    // widgets
    widgets::ApphubAppCard::ensure_type();
    widgets::ApphubAppLinks::ensure_type();
    widgets::ApphubInstallBtn::ensure_type();

    // views
    views::ApphubAppPage::ensure_type();
    views::ApphubHomePage::ensure_type();
    views::ApphubWindow::ensure_type();

    // enums
    models::TransactionType::ensure_type();
    models::InstallLocation::ensure_type();

    // models
    models::ApphubTransaction::ensure_type();
    
    // stores
    models::UpdatesList::ensure_type();
    models::InstalledAppsList::ensure_type();
    models::TransactionList::ensure_type();

    // application/state
    models::Context::ensure_type();
    ApphubApplication::ensure_type();
}
