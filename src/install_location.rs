use crate::prelude::*;
#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, glib::Enum)]
#[enum_type(name = "ApphubInstallLocation")]
pub enum ApphubInstallLocation {
    #[default]
    System,
    User,
}

impl Into<libflatpak::Installation> for ApphubInstallLocation {
    fn into(self) -> libflatpak::Installation {
        match self {
            ApphubInstallLocation::System => {
                libflatpak::Installation::new_system(Cancellable::NONE).unwrap()
            }
            ApphubInstallLocation::User => {
                libflatpak::Installation::new_user(Cancellable::NONE).unwrap()
            }
        }
    }
}

impl Into<libflatpak::Installation> for &ApphubInstallLocation {
    fn into(self) -> libflatpak::Installation {
        match self {
            ApphubInstallLocation::System => {
                libflatpak::Installation::new_system(Cancellable::NONE).unwrap()
            }
            ApphubInstallLocation::User => {
                libflatpak::Installation::new_user(Cancellable::NONE).unwrap()
            }
        }
    }
}
