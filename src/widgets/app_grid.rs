use ashpd::desktop::print::Orientation;
use gtk::glib::clone;
use macros::GtkWidget;

use crate::{blueprint, utils::Context};

use adw::prelude::*;
use {crate::flathub, crate::widgets, gtk::Widget};

#[derive(GtkWidget, Clone)]
struct Template {
    pub flow: gtk::FlowBox,
}

pub fn app_grid(ctx: &Context, query: &flathub::QueryInfo) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/app_grid.blp");
    for app in &query.hits {
        ui.flow.append(&widgets::app_card(app));
    }
    return ui.flow;
}
