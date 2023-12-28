mod application;
mod error;
mod models;
mod utils;
mod views;
mod widgets;
mod state;

use application::ApphubApplication;
use glib::StaticTypeExt;

fn main() -> glib::ExitCode {
    register_types();
    let app = ApphubApplication::new();
    app.run()
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
}
