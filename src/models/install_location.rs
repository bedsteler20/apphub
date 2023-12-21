use gio::Cancellable;

#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, glib::Enum)]
#[enum_type(name = "ApphubInstallLocation")]
pub enum InstallLocation {
    #[default]
    System,
    User,
}

impl Into<libflatpak::Installation> for InstallLocation {
    fn into(self) -> libflatpak::Installation {
        match self {
            InstallLocation::System => {
                libflatpak::Installation::new_system(Cancellable::NONE).unwrap()
            }
            InstallLocation::User => libflatpak::Installation::new_user(Cancellable::NONE).unwrap(),
        }
    }
}

impl Into<libflatpak::Installation> for &InstallLocation {
    fn into(self) -> libflatpak::Installation {
        match self {
            InstallLocation::System => {
                libflatpak::Installation::new_system(Cancellable::NONE).unwrap()
            }
            InstallLocation::User => libflatpak::Installation::new_user(Cancellable::NONE).unwrap(),
        }
    }
}
