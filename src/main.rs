mod context;
mod data_loader;
mod error;
mod flathub_client;
mod install_location;
mod prelude;
mod transaction;
mod transaction_state;
mod transaction_type;

// ====================
mod application;
mod models;
mod utils;
mod views;
mod widgets;
// ====================

use application::ApphubApplication;


fn main() -> glib::ExitCode {
    let app = ApphubApplication::new();
    app.run()
}
