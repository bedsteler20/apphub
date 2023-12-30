use glib::{subclass::types::ObjectSubclassIsExt, IsA};

use crate::{utils::Findable, views};

pub enum Page {
    Home,
    Installed,
    Updates,
    App(String),
}

impl Page {
    pub fn route(&self) -> String {
        match self {
            Page::Home => "/home".to_string(),
            Page::Installed => "/installed".to_string(),
            Page::Updates => "/updates".to_string(),
            Page::App(id) => format!("/app/{}", id),
        }
    }

    pub fn matches(&self, route: &str) -> bool {
        match self {
            Page::Home => route == "/home",
            Page::Installed => route == "/installed",
            Page::Updates => route == "/updates",
            Page::App(id) => route == format!("/app/{}", id),
        }
    }

    pub fn is_static(&self) -> bool {
        match self {
            Page::Home => true,
            _ => false,
        }
    }

    pub fn is_top_level(&self) -> bool {
        match self {
            Page::Home => true,
            Page::Installed => true,
            Page::Updates => true,
            _ => false,
        }
    }

    pub fn parse(route: &str) -> Self {
        if route == "/home" {
            Page::Home
        } else if route == "/installed" {
            Page::Installed
        } else if route == "/updates" {
            Page::Updates
        } else if route.starts_with("/app/") {
            Page::App(route.replace("/app/", "").to_string())
        } else {
            panic!("No page matches route {}", route)
        }
    }

    pub fn create_page(&self) -> adw::NavigationPage {
        match self {
            Page::Home => adw::NavigationPage::builder()
                .title("Apphub")
                .tag(self.route())
                .child(&views::ApphubHomePage::find())
                .build(),
            Page::Installed => adw::NavigationPage::builder()
                .title("Installed Apps")
                .tag(self.route())
                .child(&views::InstalledAppsPage::new())
                .build(),
            Page::Updates => adw::NavigationPage::builder()
                .title("Updates")
                .tag(self.route())
                .child(&views::UpdatesAppsPage::new())
                .build(),
            Page::App(id) => adw::NavigationPage::builder()
                .title("App")
                .tag(self.route())
                .child(&views::ApphubAppPage::new(id))
                .build(),
        }
    }
}
