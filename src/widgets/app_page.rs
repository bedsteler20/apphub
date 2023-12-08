use crate::{disconnect_handel, prelude::*};

#[derive(GtkWidget, Clone)]
#[allow(unused)]
struct Template {
    pub root: gtk::ScrolledWindow,
    pub icon: gtk::Image,
    pub name_label: gtk::Label,
    pub dev_label: gtk::Label,
    pub install_btn: gtk::Button,
    pub uninstall_btn: gtk::Button,
    pub open_btn: gtk::Button,
    pub caracal_container: adw::Clamp,
    pub summary_label: gtk::Label,
    pub description_label: gtk::Label,
    pub app_links: adw::Bin,
}

pub fn app_page(ctx: &Context, app_id: &String) -> adw::NavigationPage {
    let ui: Template = blueprint!(Template, "src/widgets/app_page.blp");

    let build_ui = clone!(@strong ui, @strong ctx => move |app_info: flathub::AppInfo| {
        let app_id = app_info.id.clone();

        // ======== Setup State ========
        if flatpak::is_app_installed(&app_info.id).unwrap_or(false) {
            ui.install_btn.set_visible(false);
            ui.uninstall_btn.set_visible(true);
            ui.open_btn.set_visible(true);
        } else {
            ui.install_btn.set_visible(true);
            ui.uninstall_btn.set_visible(false);
            ui.open_btn.set_visible(false);
        }

        if let Some(state) = ctx.transaction_store.get(&app_id) {
            match state.state {
                store::TransactionState::Install => {
                    if state.stage == store::TransactionStage::Progress {
                        // TODO: Show progress
                    }
                },
                store::TransactionState::Uninstall => {
                    if state.stage == store::TransactionStage::Progress {
                        // TODO: Show progress
                    }
                },
                _ => {},
            };
        }

        // ======== Display Data ========
        ui.name_label.set_text(&app_info.name);
        ui.app_links.set_child(Some(&widgets::app_links(&app_info)));

        ui.open_btn.connect_clicked(clone!(@strong app_id => move |_| {
            flatpak::open_app(&app_id);
        }));

        ui.install_btn.connect_clicked(clone!(@strong app_id, @strong ctx => move |_| {
            flatpak::install_app(&ctx, flatpak::InstallLocation::User, &app_id)
        }));

        ui.uninstall_btn.connect_clicked(clone!(@strong app_id, @strong ctx => move |_| {
            // TODO: Start uninstall
        }));

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


        // ======== Bind State ========
        let handle = ctx.transaction_store.subscribe(&app_id, Rc::new(clone!(@strong ui => move |transact| {
            match transact.state {
                store::TransactionState::Install => {
                    if transact.canaled {
                        ui.install_btn.set_visible(true);
                        ui.uninstall_btn.set_visible(false);
                        ui.open_btn.set_visible(false);
                        return;
                    }

                    if transact.error.is_some() {
                        ui.install_btn.set_visible(true);
                        ui.uninstall_btn.set_visible(false);
                        ui.open_btn.set_visible(false);
                        return;
                    }

                    match transact.stage {
                        store::TransactionStage::Start => {
                            ui.install_btn.set_visible(false);
                            ui.uninstall_btn.set_visible(false);
                            ui.open_btn.set_visible(false);
                        },
                        store::TransactionStage::Progress => {
                            println!("Progress: {}", transact.progress);
                        },
                        store::TransactionStage::End => {
                            ui.install_btn.set_visible(false);
                            ui.uninstall_btn.set_visible(true);
                            ui.open_btn.set_visible(true);
                        },
                    };
                },
                store::TransactionState::Uninstall => {
                    if transact.canaled {
                        ui.install_btn.set_visible(false);
                        ui.uninstall_btn.set_visible(true);
                        ui.open_btn.set_visible(true);
                        return;
                    }

                    if transact.error.is_some() {
                        ui.install_btn.set_visible(false);
                        ui.uninstall_btn.set_visible(true);
                        ui.open_btn.set_visible(true);
                        return;
                    }

                    match transact.stage {
                        store::TransactionStage::Start => {
                            ui.install_btn.set_visible(false);
                            ui.uninstall_btn.set_visible(false);
                            ui.open_btn.set_visible(false);
                        },
                        store::TransactionStage::Progress => {
                            println!("Progress: {}", transact.progress);
                        },
                        store::TransactionStage::End => {
                            ui.install_btn.set_visible(true);
                            ui.uninstall_btn.set_visible(false);
                            ui.open_btn.set_visible(false);
                        },
                    };
                },
                _ => {},
            };
        })));



        disconnect_handel!(ui.root, handle, |s| {
            ctx.transaction_store.unsubscribe(s);
        });


    });

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
