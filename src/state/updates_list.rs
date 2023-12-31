use crate::models::InstalledApp;
use crate::models::InstalledAppSendable;
use crate::utils::Sendable;
use gio::prelude::*;
use gio::subclass::prelude::*;
use gio::Cancellable;
use libflatpak::prelude::*;
use std::cell::RefCell;
use std::thread;

mod imp {
    use super::*;

    #[derive(Debug, Default)]
    pub struct UpdatesList {
        pub list: RefCell<Vec<InstalledApp>>,
    }
    #[glib::object_subclass]
    impl ObjectSubclass for UpdatesList {
        const NAME: &'static str = "UpdatesList";
        type Type = super::UpdatesList;
        type Interfaces = (gio::ListModel,);
    }

    impl ObjectImpl for UpdatesList {
        fn constructed(&self) {
            self.parent_constructed();
            let binding = self.obj();
            binding.refresh();
        }
    }

    impl ListModelImpl for UpdatesList {
        fn item_type(&self) -> glib::Type {
            InstalledApp::static_type()
        }

        fn n_items(&self) -> u32 {
            self.list.borrow().len() as u32
        }

        fn item(&self, position: u32) -> Option<glib::Object> {
            self.list
                .try_borrow()
                .ok()?
                .get(position as usize)
                .map(|v| v.clone().upcast())
        }
    }
}

glib::wrapper! {
    pub struct UpdatesList(ObjectSubclass<imp::UpdatesList>)
        @implements gio::ListModel;
}

impl UpdatesList {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    pub fn push(&self, app: InstalledApp) {
        let mut list = self.imp().list.borrow_mut();
        list.push(app);
        self.items_changed(list.len() as u32, 0, 1);
    }

    pub fn append(&self, apps: Vec<InstalledApp>) {
        let mut list = self.imp().list.borrow_mut();
        let len = list.len();
        let a_len = apps.len();
        list.extend(apps);
        self.items_changed(len as u32, 0, a_len as u32);
    }

    pub fn remove(&self, app: InstalledApp) {
        let mut list = self.imp().list.borrow_mut();
        let index = list
            .iter()
            .position(|x| {
                x.app_id() == app.app_id() && x.install_location() == app.install_location()
            })
            .unwrap();
        list.remove(index);
        self.items_changed(index as u32, 1, 0);
    }

    pub fn has_update(&self, app_id: &str) -> bool {
        let list = self.imp().list.borrow();
        list.iter().any(|x| x.app_id() == app_id)
    }

    pub fn get(&self, app_id: &str) -> Option<InstalledApp> {
        let list = self.imp().list.borrow();
        list.iter().find(|x| x.app_id() == app_id).cloned()
    }

    #[allow(deprecated)]
    pub fn refresh(&self) {
        let (sender, receiver) = glib::MainContext::channel::<
            Result<Vec<InstalledAppSendable>, glib::Error>,
        >(glib::Priority::default());

        receiver.attach(Default::default(), {
            let this = self.clone();
            move |apps| {
                match apps {
                    Ok(apps) => {
                        let apps = apps
                            .into_iter()
                            .map(|x| InstalledApp::from_sendable(x))
                            .collect::<Vec<InstalledApp>>();
                        this.append(apps);
                    }
                    Err(e) => {
                        eprintln!("Error: {}", e);
                    }
                }
                glib::ControlFlow::Break
            }
        });

        thread::spawn(move || {
            let sys_install = libflatpak::Installation::new_system(Cancellable::NONE).unwrap();
            let user_install = libflatpak::Installation::new_user(Cancellable::NONE).unwrap();
            let user_apps = match user_install.list_installed_refs_for_update(Cancellable::NONE) {
                Ok(apps) => apps,
                Err(e) => {
                    sender.send(Err(e)).unwrap();
                    return;
                }
            };
            let sys_apps = match sys_install.list_installed_refs_for_update(Cancellable::NONE) {
                Ok(apps) => apps,
                Err(e) => {
                    sender.send(Err(e)).unwrap();
                    return;
                }
            };
            let mut apps = Vec::new();
            for app in user_apps {
                let app = InstalledApp::from_flatpak(&app, &user_install).to_sendable();
                apps.push(app);
            }
            for app in sys_apps {
                let app = InstalledApp::from_flatpak(&app, &sys_install).to_sendable();
                apps.push(app);
            }
            sender.send(Ok(apps)).unwrap();
        });
    }
}
