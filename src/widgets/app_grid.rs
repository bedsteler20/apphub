use crate::prelude::*;

#[derive(GtkWidget, Clone)]
struct Template {
    pub flow: gtk::FlowBox,
}

pub fn app_grid(ctx: &Context, query: &flathub::QueryInfo) -> impl IsA<Widget> {
    let ui: Template = blueprint!(Template, "src/widgets/app_grid.blp");
    for app in &query.hits {
        let clamp = adw::Clamp::new();
        clamp.set_maximum_size(300);
        clamp.set_orientation(gtk::Orientation::Horizontal);
        clamp.set_child(Some(&widgets::app_card(app)));
        ui.flow.append(&clamp);
    }
    return ui.flow;
}
