use adw::prelude::*;
use gtk::glib::clone;
use macros::GtkWidget;

use crate::blueprint;
use crate::navigator::connect_navigator;
use crate::widgets;

#[derive(GtkWidget, Clone)]
struct Template {
    pub root: adw::ApplicationWindow,
    pub search_bar: gtk::SearchEntry,
    pub view_stack: adw::NavigationView,
    pub back_btn: gtk::Button,
}

pub fn window(app: &adw::Application) -> adw::ApplicationWindow {
    let ui: Template = blueprint!(Template, "src/widgets/window.blp");
    ui.root.set_application(Some(app));

    ui.search_bar.connect_search_changed(|search_bar| {
        println!("{}", search_bar.text().as_str());
    });

    ui.view_stack
        .connect_visible_page_notify(clone!(@strong ui => move |view| {
            let page = view.visible_page().unwrap();
            if page.tag().unwrap().to_string() == widgets::HOME_PAGE_TAG {
                ui.back_btn.set_visible(false);
            } else {
                ui.back_btn.set_visible(true);
            }
        }));

    connect_navigator(app, &ui.root, &ui.view_stack);

    return ui.root;
}
