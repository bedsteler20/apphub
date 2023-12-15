mod install_location;
mod prelude;
mod transaction;
mod transaction_type;
mod error;
mod transaction_state;
mod flathub_client;
mod window;
mod app_card;
mod app_grid;
mod app_links;
mod app_page;
mod home_page;
mod install_btn;
mod screenshots_caracal;
mod context;

use crate::prelude::*;

fn main() -> glib::ExitCode {
    let app = adw::Application::new(Some("com.github.bed.apphub"), Default::default());
    app.connect_activate(|app| {
        let window = window::ApphubWindow::new(&app);
        window.present();
    });

    app.run()
}
