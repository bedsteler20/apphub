use macros::GtkWidget;
use adw::prelude::*;

use crate::blueprint;
use crate::widgets;

#[derive(GtkWidget)]
struct Template {
    pub root: adw::ApplicationWindow,
    pub search_bar: gtk::SearchEntry,
    pub view_stack: adw::NavigationView,
}

pub fn window(app: &adw::Application) -> adw::ApplicationWindow {
    let ui: Template = blueprint!(Template, "src/widgets/window.blp");
    ui.root.set_application(Some(app));

    let home_page = widgets::home_page();

    ui.view_stack.push(&home_page);

    ui.search_bar.connect_search_changed(|search_bar| {
        println!("{}", search_bar.text().as_str());
    });

    
    
    
    return ui.root;
}
