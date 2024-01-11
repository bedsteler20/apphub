use tr::tr;
//pub type Result<T> = core::result::Result<T, Error>;

pub enum Error {
    FlatpakError(libflatpak::Error),
    GlibError(String, String),
    IoError(std::io::Error),
    Other(String),
    RequestsMiddleware(anyhow::Error),
    Requests(reqwest::Error),
}

impl std::fmt::Debug for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Error::FlatpakError(e) => write!(f, "FlatpakError: {:?}", e),
            Error::IoError(e) => write!(f, "IoError: {:?}", e),
            Error::Other(e) => write!(f, "OtherError: {:?}", e),
            Error::GlibError(domain, msg) => {
                write!(f, "GlibError:\n\tDomain: {}\n\tMessage: {}", domain, msg)
            }
            Error::RequestsMiddleware(e) => write!(f, "RequestsMiddleware: {:?}", e),
            Error::Requests(e) => write!(f, "Requests: {:?}", e),
        }
    }
}

impl From<libflatpak::Error> for Error {
    fn from(e: libflatpak::Error) -> Self {
        Error::FlatpakError(e)
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

impl From<anyhow::Error> for Error {
    fn from(e: anyhow::Error) -> Self {
        Error::RequestsMiddleware(e)
    }
}

impl From<reqwest::Error> for Error {
    fn from(e: reqwest::Error) -> Self {
        Error::Requests(e)
    }
}

impl From<flathub_rs::Error> for Error {
    fn from(e: flathub_rs::Error) -> Self {
        match e {
            flathub_rs::Error::Middleware(e) => Error::RequestsMiddleware(e),
            flathub_rs::Error::Requests(e) => Error::Requests(e),
        }
    }
}

impl ToString for Error {
    fn to_string(&self) -> String {
        match self {
            Error::FlatpakError(e) => format!("FlatpakError: {:?}", e),
            Error::IoError(e) => format!("IoError: {:?}", e),
            Error::Other(e) => format!("OtherError: {:?}", e),
            Error::GlibError(domain, msg) => {
                format!("GlibError:\n\tDomain: {}\n\tMessage: {}", domain, msg)
            }
            Error::RequestsMiddleware(e) => format!("RequestsMiddleware: {:?}", e),
            Error::Requests(e) => format!("Requests: {:?}", e),
        }
    }
}
impl rose::DisplayableError for Error {
    fn body(&self) -> String {
        self.to_string()
    }

    fn title(&self) -> String {
        tr!("Error")
    }
}
