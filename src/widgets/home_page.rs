use crate::prelude::*;
#[derive(GtkWidget, Clone)]
struct Template {
    pub root: gtk::ScrolledWindow,
    pub recently_added_box: gtk::Box,
    pub recently_updated_box: gtk::Box,
    pub popular_box: gtk::Box,
    // pub recently_added_btn: gtk::Button,
    // pub recently_updated_btn: gtk::Button,
    // pub popular_btn: gtk::Button,
}

enum DataTagged {
    RecentlyAdded(reqwest::Result<flathub::QueryInfo>),
    RecentlyUpdated(reqwest::Result<flathub::QueryInfo>),
    Popular(reqwest::Result<flathub::QueryInfo>),
}

pub fn home_page(ctx: &Context) -> adw::NavigationPage {
    let ui: Template = blueprint!(Template, "src/widgets/home_page.blp");

    // ui.recently_added_btn
    //     .set_action_name(Some("app.navigator.visit"));
    // ui.recently_added_btn
    //     .set_action_target_value(Some(&glib::Variant::from("/recently-added")));
    // ui.recently_updated_btn
    //     .set_action_name(Some("app.navigator.visit"));
    // ui.recently_updated_btn
    //     .set_action_target_value(Some(&glib::Variant::from("/recently-updated")));
    // ui.popular_btn.set_action_name(Some("app.navigator.visit"));
    // ui.popular_btn
    //     .set_action_target_value(Some(&glib::Variant::from("/popular")));

    let lazy = widgets::lazy(clone!(@strong ui => move |bin| {
        let (sender, receiver) = async_channel::bounded::<DataTagged>(3);

        runtime.spawn(clone!(@strong sender => async move {

            let response = flathub::query(flathub::Query::RecentlyAdded, 1, 12).await;
            sender.send(DataTagged::RecentlyAdded(response)).await.expect(&tr!("The channel needs to be open."));
        }));
        runtime.spawn(clone!(@strong sender => async move {
            let response = flathub::query(flathub::Query::RecentlyUpdated, 1, 12).await;
            sender.send(DataTagged::RecentlyUpdated(response)).await.expect(&tr!("The channel needs to be open."));
        }));
        runtime.spawn(clone!(@strong sender => async move {
            let response = flathub::query(flathub::Query::Popular, 1, 12).await;
            sender.send(DataTagged::Popular(response)).await.expect(&tr!("The channel needs to be open."));
        }));

        glib::spawn_future_local(clone!(@strong bin, @strong ctx => async move {
            let mut count = 0;
            while let Ok(response) = receiver.recv().await {
                count += 1;
                match response {
                    DataTagged::RecentlyAdded(Ok(query_info)) => {
                        ui.recently_added_box.append(&widgets::app_grid(&ctx, &query_info));
                    },
                    DataTagged::Popular(Ok(query_info)) => {
                        ui.popular_box.append(&widgets::app_grid(&ctx, &query_info));
                    },
                    DataTagged::RecentlyUpdated(Ok(query_info)) => {
                        ui.recently_updated_box.append(&widgets::app_grid(&ctx, &query_info));
                    },
                    // TODO: Add error Widget
                    DataTagged::RecentlyAdded(Err(_)) => {
                        println!("{}", tr!("Could not make a `GET` request."));
                        break;
                    },
                    DataTagged::RecentlyUpdated(Err(_)) => {
                        println!("{}", tr!("Could not make a `GET` request."));
                        break;
                    },
                    DataTagged::Popular(Err(_)) => {
                        println!("{}", tr!("Could not make a `GET` request."));
                        break;
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
        .title(tr!("Explore"))
        .child(&lazy)
        .build();
}
