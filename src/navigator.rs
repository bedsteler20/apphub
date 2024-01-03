use glib::subclass::types::ObjectSubclassIsExt;

use crate::{
    utils::Findable,
    views::{self, PagerNavigator},
};
use tr::tr;

pub trait Navigator {
    fn route(&self) -> String;
    fn matches(&self, route: &str) -> bool;
    fn is_static(&self) -> bool {
        false
    }
    fn is_top_level(&self) -> bool {
        false
    }
    fn parse(route: &str) -> Self;
    fn create_page(&self) -> adw::NavigationPage;
}

pub enum Page {
    Home,
    Installed,
    Updates,
    App(String),
    Pager(PagerNavigator),
}

impl Navigator for Page {
    fn route(&self) -> String {
        match self {
            Page::Home => "/home".to_string(),
            Page::Installed => "/installed".to_string(),
            Page::Updates => "/updates".to_string(),
            Page::App(id) => format!("/app/{}", id),
            Page::Pager(navigator) => navigator.route(),
        }
    }

    fn matches(&self, route: &str) -> bool {
        match self {
            Page::Home => route == "/home",
            Page::Installed => route == "/installed",
            Page::Updates => route == "/updates",
            Page::App(id) => route == format!("/app/{}", id),
            Page::Pager(nav) => nav.matches(&route),
        }
    }

    fn is_static(&self) -> bool {
        match self {
            Page::Home => true,
            _ => false,
        }
    }

    fn is_top_level(&self) -> bool {
        match self {
            Page::Home => true,
            Page::Installed => true,
            Page::Updates => true,
            _ => false,
        }
    }

    fn parse(route: &str) -> Self {
        if route == "/home" {
            Page::Home
        } else if route == "/installed" {
            Page::Installed
        } else if route == "/updates" {
            Page::Updates
        } else if route.starts_with("/app/") {
            Page::App(route.replace("/app/", "").to_string())
        } else if route.starts_with("/pager/") {
            Page::Pager(PagerNavigator::parse(&route))
        } else {
            panic!("No page matches route {}", route)
        }
    }

    fn create_page(&self) -> adw::NavigationPage {
        match self {
            Page::Home => views::ApphubWindow::find().imp().home_page.get(),
            Page::Installed => adw::NavigationPage::builder()
                .title(&tr!("Installed Apps"))
                .tag(self.route())
                .child(&views::InstalledAppsPage::new())
                .build(),
            Page::Updates => adw::NavigationPage::builder()
                .title(&tr!("Updates"))
                .tag(self.route())
                .child(&views::UpdatesAppsPage::new())
                .build(),
            Page::App(id) => adw::NavigationPage::builder()
                .title(&tr!("App"))
                .tag(self.route())
                .child(&views::ApphubAppPage::new(id))
                .build(),
            Page::Pager(navigator) => navigator.create_page(),
        }
    }
}
