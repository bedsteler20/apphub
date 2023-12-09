use crate::{prelude::*, backend::run_install};

use super::MsgDialogBuilder;

#[derive(Clone, GtkWidget)]
struct Template {
    pub root: gtk::Box,
    pub install_btn: gtk::Button,
    pub update_btn: gtk::Button,
    pub open_btn: gtk::Button,
    pub progress_box: gtk::Box,
    pub progress_label: gtk::Label,
    pub progress_bar: gtk::ProgressBar,
    pub uninstall_btn: gtk::Button,
    pub cancel_btn: gtk::Button,
}

impl Template {
    pub fn set_state(&self, state: State) {
        match state {
            State::Installing => {
                self.install_btn.set_visible(false);
                self.update_btn.set_visible(false);
                self.open_btn.set_visible(false);
                self.progress_box.set_visible(true);
                self.progress_label.set_text(&tr!("Installing..."));
                self.progress_bar.set_fraction(0.0);
                self.uninstall_btn.set_visible(false);
                self.cancel_btn.set_visible(true);
            }
            State::Uninstalling => {
                self.install_btn.set_visible(false);
                self.update_btn.set_visible(false);
                self.open_btn.set_visible(false);
                self.progress_box.set_visible(true);
                self.progress_label.set_text(&tr!("Uninstalling..."));
                self.progress_bar.set_fraction(0.0);
                self.uninstall_btn.set_visible(false);
                self.cancel_btn.set_visible(true);
            }
            State::Updating => {
                self.install_btn.set_visible(false);
                self.update_btn.set_visible(false);
                self.open_btn.set_visible(false);
                self.progress_box.set_visible(true);
                self.progress_label.set_text(&tr!("Updating..."));
                self.progress_bar.set_fraction(0.0);
                self.uninstall_btn.set_visible(false);
                self.cancel_btn.set_visible(true);
            }
            State::Installed => {
                self.install_btn.set_visible(false);
                self.update_btn.set_visible(false);
                self.open_btn.set_visible(true);
                self.progress_box.set_visible(false);
                self.uninstall_btn.set_visible(true);
                self.cancel_btn.set_visible(false);
            }
            State::NotInstalled => {
                self.install_btn.set_visible(true);
                self.update_btn.set_visible(false);
                self.open_btn.set_visible(false);
                self.progress_box.set_visible(false);
                self.uninstall_btn.set_visible(false);
                self.cancel_btn.set_visible(false);
            }
            State::HasUpdate => {
                self.install_btn.set_visible(false);
                self.update_btn.set_visible(true);
                self.open_btn.set_visible(false);
                self.progress_box.set_visible(false);
                self.uninstall_btn.set_visible(true);
                self.cancel_btn.set_visible(false);
            }
        };
    }

    pub fn bind_transaction(&self, transaction: &backend::ApphubTransaction) {
        transaction.connect_progress_notify({
            let ui = self.clone();
            move |transaction| {
                let progress = transaction.progress();
                if progress >= 1.0 {
                    if transaction.action() == backend::TRANSACTION_ACTION_INSTALL {
                        ui.set_state(State::Installed);
                    } else if transaction.action() == backend::TRANSACTION_ACTION_UNINSTALL {
                        ui.set_state(State::NotInstalled);
                    } else if transaction.action() == backend::TRANSACTION_ACTION_UPDATE {
                        ui.set_state(State::Installed);
                    }
                } else {
                    ui.progress_bar.set_fraction(progress);
                }
            }
        });
        transaction.connect_error_notify({
            let ui = self.clone();
            move |transaction| {
                if let Some(error) = transaction.error() {
                    println!("Error: {}", error);
                    // TODO: Show error in the UI
                    let app_id = transaction.app_id().unwrap();
                    if backend::is_app_installed(&app_id).unwrap_or(false) {
                        ui.set_state(State::Installed);
                    } else {
                        ui.set_state(State::NotInstalled);
                    }
                }
            }
        });
        self.cancel_btn.connect_clicked({
            let transaction = transaction.clone();
            let ui = self.clone();
            move |_| {
                transaction.cancellable().cancel();
                if transaction.action() == backend::TRANSACTION_ACTION_INSTALL {
                    ui.set_state(State::NotInstalled);
                } else if transaction.action() == backend::TRANSACTION_ACTION_UNINSTALL {
                    ui.set_state(State::Installed);
                } else if transaction.action() == backend::TRANSACTION_ACTION_UPDATE {
                    ui.set_state(State::Installed);
                }
            }
        });
    }
}

pub fn install_button(ctx: &Context, app_id: &str) -> gtk::Box {
    let ui: Template = blueprint!(Template, "src/widgets/install_button.blp");
    if backend::is_app_installed(app_id).unwrap_or(false) {
        ui.set_state(State::Installed);

        for update in ctx.app_updates.iter::<backend::GInstalledAppInfo>() {
            if update.is_err() {
                continue;
            }
            let update: backend::GInstalledAppInfo = update.unwrap();
            if update.app_id() == app_id {
                ui.set_state(State::HasUpdate);
                break;
            }
        }
    } else {
        ui.set_state(State::NotInstalled);
    }

    for transaction in ctx.transactions.iter::<backend::ApphubTransaction>() {
        if transaction.is_err() {
            continue;
        }
        let transaction: backend::ApphubTransaction = transaction.unwrap();
        if transaction.app_id().unwrap() == app_id {
            if transaction.action() == backend::TRANSACTION_ACTION_INSTALL {
                ui.set_state(State::Installing);
            } else if transaction.action() == backend::TRANSACTION_ACTION_UNINSTALL {
                ui.set_state(State::Uninstalling);
            } else if transaction.action() == backend::TRANSACTION_ACTION_UPDATE {
                ui.set_state(State::Updating);
            }
            ui.bind_transaction(&transaction);
            break;
        }
    }

    ui.open_btn.connect_clicked({
        let app_id = app_id.to_string();
        move |_| {
            backend::open_app(&app_id);
        }
    });

    ui.install_btn.connect_clicked({
        let ui = ui.clone();
        let ctx = ctx.clone();
        let app_id = app_id.to_string();
        move |_| {
            let transaction = run_install(&app_id, backend::InstallLocation::User);
            ctx.add_transaction(&transaction);
            ui.bind_transaction(&transaction);
            ui.set_state(State::Installing);
        }
    });

    ui.uninstall_btn.connect_clicked({
        let ui = ui.clone();
        let ctx = ctx.clone();
        let app_id = app_id.to_string();
        move |_| {
            MsgDialogBuilder::builder()
                .title(&tr!("Uninstall"))
                .body(&tr!("Are you sure you want to uninstall this app?"))
                .modal(true)
                .transient_for(&ctx.window)
                .add_action(
                    "yes",
                    &tr!("Uninstall"),
                    adw::ResponseAppearance::Destructive,
                    {
                        let (app_id, ctx, ui) = (app_id.clone(), ctx.clone(), ui.clone());
                        move |_, _| {
                            let transaction = backend::run_uninstall(&app_id);
                            ctx.add_transaction(&transaction);
                            ui.bind_transaction(&transaction);
                            ui.set_state(State::Uninstalling);
                        }
                    },
                )
                .add_action(
                    "no",
                    &tr!("Cancel"),
                    adw::ResponseAppearance::Default,
                    |dialog, _| dialog.close(),
                )
                .build()
                .present();
        }
    });

    ui.update_btn.connect_clicked({
        let ui = ui.clone();
        let ctx = ctx.clone();
        let app_id = app_id.to_string();
        move |_| {
            let transaction = backend::run_update(&ctx, &app_id);
            ctx.add_transaction(&transaction);
            ui.bind_transaction(&transaction);
            ui.set_state(State::Updating);
        }
    });

    return ui.root;
}

enum State {
    Installing,
    Uninstalling,
    Updating,
    Installed,
    NotInstalled,
    HasUpdate,
}
