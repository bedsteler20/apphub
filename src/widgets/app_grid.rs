use macros::GtkWidget;

use crate::blueprint;

use {
    crate::flathub,
    crate::widgets,
    gtk::{prelude::*, Widget},
};

#[derive(GtkWidget)]
struct Template {
    pub root: gtk::Box,
    pub flow: gtk::FlowBox,
}

pub fn app_grid(query: &flathub::QueryInfo) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/app_grid.blp");
    for app in &query.hits {
        ui.flow.append(&widgets::app_card(app));
    }

    return ui.root;
}
