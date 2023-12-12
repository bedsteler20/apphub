use crate::prelude::*;

/// A wrapper around `adw::MessageDialog` that provides a builder pattern with
/// the ability to add buttons.
pub struct MsgDialogBuilder {
    inner: adw::MessageDialog,
}

#[allow(unused)]
impl MsgDialogBuilder {
    pub fn builder() -> MsgDialogBuilder {
        MsgDialogBuilder {
            inner: adw::MessageDialog::builder().build(),
        }
    }

    pub fn title(self, title: &str) -> Self {
        self.inner.set_title(Some(title));
        self
    }

    pub fn body(self, body: &str) -> Self {
        self.inner.set_body(body);
        self
    }

    pub fn transient_for(self, parent: &impl IsA<gtk::Window>) -> Self {
        self.inner.set_transient_for(Some(parent));
        self
    }

    pub fn heading(self, heading: &str) -> Self {
        self.inner.set_heading(Some(heading));
        self
    }

    pub fn icon_name(self, icon_name: &str) -> Self {
        self.inner.set_icon_name(Some(icon_name));
        self
    }

    pub fn modal(self, modal: bool) -> Self {
        self.inner.set_modal(modal);
        self
    }

    pub fn add_action<F>(self, id: &str, label: &str, appearance: adw::ResponseAppearance, f: F) -> Self
    where
        F: Fn(&adw::MessageDialog, &str) + 'static,
    {
        self.inner.add_response(id, label);
        self.inner.connect_response(Some(id), f);
        self.inner.set_response_appearance(id, appearance);
        self
    }

    pub fn build(self) -> adw::MessageDialog {
        self.inner
    }
}
