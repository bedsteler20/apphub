use crate::prelude::*;

#[derive(GtkWidget, Clone)]
#[allow(unused)]
struct Template {
    pub root: gtk::ScrolledWindow,
    pub icon: gtk::Image,
    pub name_label: gtk::Label,
    pub dev_label: gtk::Label,
    pub install_btn_container: adw::Bin,
    pub caracal_container: adw::Clamp,
    pub summary_label: gtk::Label,
    pub description_label: gtk::Label,
    pub app_links: adw::Bin,
}

pub fn app_page(ctx: &Context, app_id: &String) -> adw::NavigationPage {
    let ui: Template = blueprint!(Template, "src/widgets/app_page.blp");

    let build_ui = {
        let ui = ui.clone();
        let ctx = ctx.clone();
        let app_id = app_id.clone();
        move |app_info: flathub::AppInfo| {

           ui.install_btn_container.set_child(Some(&widgets::install_button(&ctx, &app_id)));

            // ======== Display Data ========
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
        }
    };

    let lazy = widgets::lazy(clone!(@strong ui => move |bin| {
        let (sender, receiver) = async_channel::bounded(1);

        runtime.spawn(clone!(@strong sender, @strong app_id => async move {
            let app_info = flathub::app_info(&app_id).await;
            // let app_summary = flathub::app_summary(&app_id).await;
            sender.send(app_info).await.expect(&tr!("The channel needs to be open."));
        }));

        glib::spawn_future_local(clone!(@strong bin => async move {
            while let Ok(response) = receiver.recv().await {
                let app_info = response;
                if app_info.is_err() {
                    if let Err(err) = app_info {
                        println!("{}: {}", tr!("Error reading app_info"), err);
                    }
                    sender.close();
                    receiver.close();
                    return;
                }
                let app_info = app_info.unwrap();
                build_ui(app_info);
                bin.set_child(Some(&ui.root));
                sender.close();
                receiver.close();
                break;
            }
        }));
    }));

    return adw::NavigationPage::builder()
        .title(tr!("App"))
        .child(&lazy)
        .build();
}
