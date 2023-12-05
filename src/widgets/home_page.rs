use adw::prelude::*;
use gtk::glib::{self, clone};
use macros::GtkWidget;

use crate::utils::RUNTIME;
use crate::widgets;
use crate::{blueprint, flathub};

pub const TAG: &str = "home_page";

#[derive(GtkWidget, Clone)]
struct Template {
    pub root: gtk::ScrolledWindow,
    pub recently_added_box: gtk::Box,
    pub recently_updated_box: gtk::Box,
    pub popular_box: gtk::Box,
    pub recently_added_btn: gtk::Button,
    pub recently_updated_btn: gtk::Button,
    pub popular_btn: gtk::Button,
}

enum DataTagged {
    RecentlyAdded(reqwest::Result<reqwest::Response>),
    RecentlyUpdated(reqwest::Result<reqwest::Response>),
    Popular(reqwest::Result<reqwest::Response>),
}

pub fn home_page() -> adw::NavigationPage {
    let ui: Template = blueprint!(Template, "src/widgets/home_page.blp");

    ui.recently_added_btn
        .set_action_name(Some("app.navigator.visit"));
    ui.recently_added_btn
        .set_action_target_value(Some(&glib::Variant::from("/recently-added")));
    ui.recently_updated_btn
        .set_action_name(Some("app.navigator.visit"));
    ui.recently_updated_btn
        .set_action_target_value(Some(&glib::Variant::from("/recently-updated")));
    ui.popular_btn.set_action_name(Some("app.navigator.visit"));
    ui.popular_btn
        .set_action_target_value(Some(&glib::Variant::from("/popular")));

    let lazy = widgets::lazy(clone!(@strong ui => move |bin| {
        let (sender, receiver) = async_channel::bounded::<DataTagged>(3);

        RUNTIME.spawn(clone!(@strong sender => async move {
            let response = reqwest::get("https://flathub.org/api/v2/collection/recently-added?per_page=12&page=1").await;
            sender.send(DataTagged::RecentlyAdded(response)).await.expect("The channel needs to be open.");
        }));
        RUNTIME.spawn(clone!(@strong sender => async move {
            let response = reqwest::get("https://flathub.org/api/v2/collection/recently-updated?per_page=12&page=1").await;
            sender.send(DataTagged::RecentlyUpdated(response)).await.expect("The channel needs to be open.");
        }));
        RUNTIME.spawn(clone!(@strong sender => async move {
            let response = reqwest::get("https://flathub.org/api/v2/popular/last-month?per_page=12&page=1").await;
            sender.send(DataTagged::Popular(response)).await.expect("The channel needs to be open.");
        }));

        glib::spawn_future_local(clone!(@strong bin => async move {
            let mut count = 0;
            while let Ok(response) = receiver.recv().await {
                count += 1;
                match response {
                    DataTagged::RecentlyAdded(response) => {
                        if let Ok(response) = response {
                            let query_info = response.json::<flathub::QueryInfo>().await;
                            if let Ok(query_info) = query_info {
                                ui.recently_added_box.append(&widgets::app_grid(&query_info));
                            } else {
                                println!("Could not parse the response.");
                            }
                        } else {
                            println!("Could not make a `GET` request.");
                        }
                    },
                    DataTagged::RecentlyUpdated(response) => {
                        if let Ok(response) = response {
                            let query_info = response.json::<flathub::QueryInfo>().await;
                            if let Ok(query_info) = query_info {
                                ui.recently_updated_box.append(&widgets::app_grid(&query_info));
                            } else {
                                println!("Could not parse the response.");
                            }
                        } else {
                            println!("Could not make a `GET` request.");
                        }
                    },
                    DataTagged::Popular(response) => {
                        if let Ok(response) = response {
                            let query_info = response.json::<flathub::QueryInfo>().await;
                            if let Ok(query_info) = query_info {
                                ui.popular_box.append(&widgets::app_grid(&query_info));
                            } else {
                                println!("Could not parse the response.");
                            }
                        } else {
                            println!("Could not make a `GET` request.");
                        }
                    },
                }
                if count == 3 {
                    bin.set_child(Some(&ui.root));
                    sender.close();
                    receiver.close();
                    return;
                }
            }
        }));
    }));

    return adw::NavigationPage::builder()
        .title("Home")
        .tag(TAG)
        .child(&lazy)
        .build();
}
