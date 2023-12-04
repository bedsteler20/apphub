mod flathub;
mod utils;
mod widgets;

use adw::prelude::*;

use crate::utils::APP_ID;

fn main() {
    let app = adw::Application::new(Some(APP_ID), Default::default());
    app.connect_activate(active);
    println!("Hello, world!");
    app.run();
}

pub fn active(app: &adw::Application) {
    let window = widgets::window(app);
    window.present();
}

// fn build_ui() -> impl IsA<gtk::Widget> {
//     let box_ = gtk::Box::new(gtk::Orientation::Vertical, 0);
//     let (sender, receiver) = async_channel::bounded(1);

//     RUNTIME.spawn(clone!(@strong sender => async move {
//         let response = reqwest::get("https://flathub.org/api/v2/popular/last-month").await;
//         sender.send(response).await.expect("The channel needs to be open.");
//     }));

//     // The main loop executes the asynchronous block
//     glib::spawn_future_local(clone!(@strong box_ => async move {
//         while let Ok(response) = receiver.recv().await {
//             if let Ok(response) = response {
//                 let query_info = response.json::<flathub::QueryInfo>().await;
//                 if let Ok(query_info) = query_info {
//                     box_.append(&widgets::app_group(&query_info));
//                 } else {
//                     println!("Could not parse the response.");
//                 }
//             } else {
//                 println!("Could not make a `GET` request.");
//             }
//         }
//     }));

//     return box_;
// }
