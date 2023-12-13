use crate::InstallLocation;

mod imp {
    use std::cell::{Cell, RefCell};

    use glib::prelude::*;
    use glib::subclass::prelude::*;
    use glib::subclass::types::ObjectSubclass;

    use crate::InstallLocation;

    #[derive(Default, glib::Properties)]
    #[properties(wrapper_type = super::ApphubAppInfo)]
    pub struct ApphubAppInfo {
        #[property(get, set)]
        app_id: RefCell<String>,
        #[property(get, set)]
        name: RefCell<String>,
        #[property(get, set)]
        from_flathub: Cell<bool>,
        #[property(get, set)]
        icon: RefCell<String>,
        #[property(get, set, builder(InstallLocation::default()))]
        install_location: Cell<InstallLocation>,
        #[property(get, set)]
        flatpak_ref: RefCell<String>,
        #[property(get, set)]
        summary: RefCell<String>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for ApphubAppInfo {
        const NAME: &'static str = "ApphubAppInfo";
        type Type = super::ApphubAppInfo;
    }

    #[glib::derived_properties]
    impl ObjectImpl for ApphubAppInfo {}
}

// ====== Public Interface ======
glib::wrapper! {
    pub struct ApphubAppInfo(ObjectSubclass<imp::ApphubAppInfo>);
}

impl ApphubAppInfo {
    pub fn from_t(app_info: dbus_types::AppInfo) -> Self {
        glib::Object::builder()
            .property("app-id", app_info.app_id)
            .property("name", app_info.name)
            .property("from-flathub", app_info.from_flathub)
            .property("icon", app_info.icon)
            .property(
                "install-location",
                Into::<InstallLocation>::into(app_info.install_location),
            )
            .property("flatpak-ref", app_info.flatpak_ref)
            .property("summary", app_info.summary)
            .build()
    }
}
