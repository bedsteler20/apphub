mod application;
mod error;
mod models;
mod utils;
mod views;
mod widgets;

use application::ApphubApplication;
use glib::StaticTypeExt;
use models::{ApphubTransaction, InstallLocation, TransactionType, Context};
use views::{ApphubAppPage, ApphubHomePage, ApphubWindow};
use widgets::{ApphubAppCard, ApphubAppLinks, ApphubInstallBtn};

fn main() -> glib::ExitCode {
    register_types();
    let app = ApphubApplication::new();
    app.run()
}

fn register_types() {
    ApphubApplication::ensure_type();
    ApphubAppCard::ensure_type();
    ApphubAppLinks::ensure_type();
    ApphubAppPage::ensure_type();
    ApphubInstallBtn::ensure_type();
    ApphubHomePage::ensure_type();
    ApphubTransaction::ensure_type();
    ApphubWindow::ensure_type();
    TransactionType::ensure_type();
    InstallLocation::ensure_type();
    Context::ensure_type();
}
