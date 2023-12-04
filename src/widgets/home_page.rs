use adw::prelude::*;
use gtk::glib::{self, clone};
use gtk::prelude::*;
use macros::GtkWidget;

use crate::utils::RUNTIME;
use crate::widgets;
use crate::{blueprint, flathub};

pub const TAG: &str = "home_page";

#[derive(GtkWidget)]
struct Template {
    pub root: gtk::ScrolledWindow,
    pub recently_added_box: gtk::Box,
    pub recently_updated_box: gtk::Box,
    pub popular_box: gtk::Box,
    pub recently_added_btn: gtk::Button,
    pub recently_updated_btn: gtk::Button,
    pub popular_btn: gtk::Button,
}

pub fn home_page() -> adw::NavigationPage {
    let ui: Template = blueprint!(Template, "src/widgets/home_page.blp");

    let popular_grid = widgets::lazy(load_popular);

    let recently_added_grid = widgets::lazy(load_recently_added);

    let recently_updated_grid = widgets::lazy(load_recently_updated);

    ui.popular_box.append(&popular_grid);
    ui.recently_added_box.append(&recently_added_grid);
    ui.recently_updated_box.append(&recently_updated_grid);

    return adw::NavigationPage::builder()
        .title("Home")
        .tag(TAG)
        .child(&ui.root)
        .build();
}

// ==================== Data Loading ====================
fn load_popular(bin: &adw::Bin) {
    let (sender, receiver) = async_channel::bounded(1);
    RUNTIME.spawn(clone!(@strong sender => async move {
        let response = reqwest::get("https://flathub.org/api/v2/popular/last-month?per_page=12&page=1").await;
        sender.send(response).await.expect("The channel needs to be open.");
    }));

    glib::spawn_future_local(clone!(@strong bin => async move {
        while let Ok(response) = receiver.recv().await {
            if let Ok(response) = response {
                let query_info = response.json::<flathub::QueryInfo>().await;
                if let Ok(query_info) = query_info {
                    bin.set_child(Some(&widgets::app_grid(&query_info)));
                } else {
                    println!("Could not parse the response.");
                }
            } else {
                println!("Could not make a `GET` request.");
            }
            receiver.close();
            sender.close();
            break;
        }
    }));
}

fn load_recently_added(bin: &adw::Bin) {
    let (sender, receiver) = async_channel::bounded(1);
    RUNTIME.spawn(clone!(@strong sender => async move {
        let response = reqwest::get("https://flathub.org/api/v2/collection/recently-added?per_page=12&page=1").await;
        sender.send(response).await.expect("The channel needs to be open.");
    }));

    glib::spawn_future_local(clone!(@strong bin => async move {
        while let Ok(response) = receiver.recv().await {
            if let Ok(response) = response {
                let query_info = response.json::<flathub::QueryInfo>().await;
                if let Ok(query_info) = query_info {
                    bin.set_child(Some(&widgets::app_grid(&query_info)));
                } else {
                    println!("Could not parse the response.");
                }
            } else {
                println!("Could not make a `GET` request.");
            }
            receiver.close();
            sender.close();
            break;
        }
    }));
}

fn load_recently_updated(bin: &adw::Bin) {
    let (sender, receiver) = async_channel::bounded(1);
    RUNTIME.spawn(clone!(@strong sender => async move {
        let response = reqwest::get("https://flathub.org/api/v2/collection/recently-updated?per_page=12&page=1").await;
        sender.send(response).await.expect("The channel needs to be open.");
    }));

    glib::spawn_future_local(clone!(@strong bin => async move {
        while let Ok(response) = receiver.recv().await {
            if let Ok(response) = response {
                let query_info = response.json::<flathub::QueryInfo>().await;
                if let Ok(query_info) = query_info {
                    bin.set_child(Some(&widgets::app_grid(&query_info)));
                } else {
                    println!("Could not parse the response.");
                }
            } else {
                println!("Could not make a `GET` request.");
            }
            receiver.close();
            sender.close();
            break;
        }
    }));
}
