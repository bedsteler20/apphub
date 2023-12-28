use gio::prelude::*;
use gio::subclass::prelude::*;
use std::cell::RefCell;

use crate::state::TransactionList;
use crate::utils::flatpak_utils;
mod imp {
    use crate::models::InstalledApp;

    use super::*;

    #[derive(Debug, Default)]
    pub struct InstalledAppsList {
        pub list: RefCell<Vec<InstalledApp>>,
    }
    #[glib::object_subclass]
    impl ObjectSubclass for InstalledAppsList {
        const NAME: &'static str = "ApphubInstalledAppsList";
        type Type = super::InstalledAppsList;
        type Interfaces = (gio::ListModel,);
    }

    impl ObjectImpl for InstalledAppsList {
        fn constructed(&self) {
            self.parent_constructed();
            self.obj().refresh();
        }
    }

    impl ListModelImpl for InstalledAppsList {
        fn item_type(&self) -> glib::Type {
            InstalledApp::static_type()
        }

        fn n_items(&self) -> u32 {
            self.list.borrow().len() as u32
        }

        fn item(&self, position: u32) -> Option<glib::Object> {
            self.list
                .borrow()
                .get(position as usize)
                .map(|v| v.clone().upcast())
        }
    }
}

glib::wrapper! {
    pub struct InstalledAppsList(ObjectSubclass<imp::InstalledAppsList>)
        @implements gio::ListModel;
}

impl InstalledAppsList {
    pub fn new() -> Self {
        glib::Object::builder().build()
    }

    /// Refreshes list of installed apps when a transaction is completed
    pub fn bind_transaction_list(&self, transaction_list: &TransactionList) {
        transaction_list.connect_items_changed({
            let this = self.clone();
            move |_list, _index, removed, _added| {
                if removed > 0 {
                    this.refresh();
                }
            }
        });
    }

    pub fn refresh(&self) {
        let installed_apps = flatpak_utils::get_installed_apps();
        let mut list = self.imp().list.borrow_mut();
        list.clear();
        list.extend(installed_apps);
        self.items_changed(0, list.len() as u32, list.len() as u32);
    }
}
