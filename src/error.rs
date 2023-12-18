

pub type Result<T> = core::result::Result<T, Error>;



pub enum Error {
    FlatpakError(libflatpak::Error),
    GlibError(String, String),
    IoError(std::io::Error),
    Surf(surf::Error),
    Other(String),
}


impl std::fmt::Debug for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {

        match self {
           Error::FlatpakError(e) => write!(f, "FlatpakError: {:?}", e),
           Error::IoError(e) => write!(f, "IoError: {:?}", e),
           Error::Surf(e) => write!(f, "SurfError: {:?}", e),
           Error::Other(e) => write!(f, "OtherError: {:?}", e),
           Error::GlibError(domain, msg) => write!(f, "GlibError:\n\tDomain: {}\n\tMessage: {}",domain, msg ),
        }
    }
}

impl From<libflatpak::Error> for Error {
    fn from(e: libflatpak::Error) -> Self {
        Error::FlatpakError(e)
    }
}

impl From<surf::Error> for Error {
    fn from(e: surf::Error) -> Self {
        Error::Surf(e)
    }
}

impl From<glib::Error> for Error {
    fn from(e: glib::Error) -> Self {
        Error::GlibError(e.domain().as_str().to_string(), e.message().to_string())
    }
}

impl From<std::io::Error> for Error {
    fn from(e: std::io::Error) -> Self {
        Error::IoError(e)
    }
}

impl From<String> for Error {
    fn from(e: String) -> Self {
        Error::Other(e)
    }
}

impl From<&str> for Error {
    fn from(e: &str) -> Self {
        Error::Other(e.to_string())
    }
}

impl ToString for Error {
    fn to_string(&self) -> String {
        match self {
            Error::FlatpakError(e) => format!("FlatpakError: {:?}", e),
            Error::IoError(e) => format!("IoError: {:?}", e),
            Error::Surf(e) => format!("SurfError: {:?}", e),
            Error::Other(e) => format!("OtherError: {:?}", e),
            Error::GlibError(domain, msg) => format!("GlibError:\n\tDomain: {}\n\tMessage: {}",domain, msg ),
        }
    }
}