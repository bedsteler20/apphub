use crate::models::installed_app::InstalledApp;
use gio::prelude::*;
use gio::subclass::prelude::*;
use gio::Cancellable;
use glib::prelude::*;
use glib::subclass::prelude::*;
use glib::subclass::types::InterfaceList;
use indexmap::IndexMap;
use libflatpak::prelude::*;
use std::cell::RefCell;
mod imp {

    use crate::models::InstallLocation;

    use super::*;
    #[derive(Debug, Default)]
    pub struct InstalledAppStore {
        pub list: RefCell<IndexMap<String, InstalledApp>>,
    }
    #[glib::object_subclass]
    impl ObjectSubclass for InstalledAppStore {
        const NAME: &'static str = "VolumeList";
        type Type = super::InstalledAppStore;
        type Interfaces = (gio::ListModel,);
    }

    impl ObjectImpl for InstalledAppStore {
        fn constructed(&self) {
            self.parent_constructed();
            let sys_install = libflatpak::Installation::new_system(Cancellable::NONE).unwrap();
            let user_install = libflatpak::Installation::new_user(Cancellable::NONE).unwrap();
            let sys_apps = sys_install.list_installed_refs(Cancellable::NONE).unwrap();
            let user_apps = user_install.list_installed_refs(Cancellable::NONE).unwrap();

            let mut list = self.list.borrow_mut();
 
            for app in sys_apps.iter() {
                
            }
        }
    }

    impl ListModelImpl for InstalledAppStore {
        fn item_type(&self) -> glib::Type {
            InstalledApp::static_type()
        }

        fn n_items(&self) -> u32 {
            self.list.borrow().len() as u32
        }

        fn item(&self, position: u32) -> Option<glib::Object> {
            self.list
                .borrow()
                .get_index(position as usize)
                .map(|(_, v)| v.clone().upcast())
        }
    }
}

glib::wrapper! {
    pub struct InstalledAppStore(ObjectSubclass<imp::InstalledAppStore>)
        @implements gio::ListModel;
}
