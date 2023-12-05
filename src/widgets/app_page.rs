use crate::blueprint;
use crate::flathub;
use crate::utils::RUNTIME;
use crate::widgets;
use adw::prelude::*;
use gtk::glib;
use gtk::glib::clone;
use macros::GtkWidget;

#[derive(GtkWidget, Clone)]
#[allow(unused)]
struct Template {
    pub root: gtk::ScrolledWindow,
    pub icon: gtk::Image,
    pub name_label: gtk::Label,
    pub dev_label: gtk::Label,
    pub install_box: gtk::Box,
    pub caracal_container: adw::Clamp,
    pub summary_label: gtk::Label,
    pub description_label: gtk::Label,
    pub app_links: adw::Bin,
}

pub fn app_page(app_id: &String) -> adw::NavigationPage {
    let ui: Template = blueprint!(Template, "src/widgets/app_page.blp");

    let build_ui = clone!(@strong ui => move |app_info: flathub::AppInfo| {
        ui.name_label.set_text(&app_info.name);
        ui.app_links.set_child(Some(&widgets::app_links(&app_info)));

        if let Some(summery) = app_info.summary.as_ref() {
            ui.summary_label.set_text(summery);
        }

        if let Some(description) = app_info.description.as_ref() {
            let description = description.replace("\n", "<br/>");
            let description = description.replace("<p>", "").replace("</p>", "\n");
            let description = description.replace("<ul>", "\n").replace("</ul>", "");
            let description = description.replace("<li>", " - ").replace("</li>", "\n");
            ui.description_label.set_markup(&description.to_string());
        }

        if let Some(developer) = app_info.developer_name.as_ref() {
            ui.dev_label.set_text(developer);
        }

        if let Some(screenshots) = app_info.screenshots.as_ref() {
            let caracal = widgets::screenshots_caracal(screenshots);
            ui.caracal_container.set_child(Some(&caracal));
        }


        if let Some(icon) = app_info.icon.as_ref() {
            widgets::image(icon, &ui.icon);
        }
    });

    let lazy = widgets::lazy(clone!(@strong ui => move |bin| {
        let (sender, receiver) = async_channel::bounded(1);
        RUNTIME.spawn(clone!(@strong sender, @strong app_id => async move {
            let response = reqwest::get(&format!("https://flathub.org/api/v2/appstream/{}", &app_id)).await;
            sender.send(response).await.expect("The channel needs to be open.");
        }));


        glib::spawn_future_local(clone!(@strong bin => async move {
            while let Ok(response) = receiver.recv().await {
                if let Ok(response) = response {
                    let app_info = response.json::<flathub::AppInfo>().await;
                    if let Ok(app_info) = app_info {
                        build_ui(app_info);
                        bin.set_child(Some(&ui.root));
                    } else {
                        println!("Could not parse the response.");
                    }
                } else {
                    println!("Could not get the response.");
                }
            }
        }));
    }));

    return adw::NavigationPage::builder()
        .title("App")
        .tag("app_page")
        .child(&lazy)
        .build();
}
