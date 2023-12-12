use std::thread;

use crate::prelude::*;

use super::{app_info::GInstalledAppInfo, apps::process_ref, InstallLocation, InstalledAppInfo};

pub fn apps_with_updates(list_store: gio::ListStore) {
    for i in 0..(list_store.n_items()) {
        list_store.remove(i);
    }
    let (sender, receiver) =
        glib::MainContext::channel::<Option<InstalledAppInfo>>(glib::Priority::default());

    thread::spawn(move || {
        println!("Checking for updates");
        let sys_install = libflatpak::Installation::new_system(Cancellable::NONE).unwrap();
        let user_install = libflatpak::Installation::new_user(Cancellable::NONE).unwrap();
        let sys_refs = sys_install
            .list_installed_refs_for_update(Cancellable::NONE)
            .unwrap();
        let user_refs = user_install
            .list_installed_refs_for_update(Cancellable::NONE)
            .unwrap();
        for r in sys_refs {
            sender
                .send(Some(process_ref(r, InstallLocation::System)))
                .unwrap();
        }
        for r in user_refs {
            sender
                .send(Some(process_ref(r, InstallLocation::System)))
                .unwrap();
        }
        println!("Done checking for updates");
        sender.send(None).unwrap();
    });

    receiver.attach(None, move |app| {
        if let Some(app) = app {
            list_store.append(&Into::<GInstalledAppInfo>::into(app));
            glib::ControlFlow::Continue
        } else {
            glib::ControlFlow::Break
        }
    });
}
