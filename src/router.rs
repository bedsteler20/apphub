use adw::prelude::*;
use adw::subclass::prelude::*;
use glib::IsA;
use std::cell::Cell;

mod imp {
    use super::*;

    #[derive(Default, Debug, glib::Properties)]
    #[properties(wrapper_type = super::Router)]
    pub struct Router {
        view: adw::NavigationView,
        #[property(get, set)]
        can_go_back: Cell<bool>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for Router {
        const NAME: &'static str = "Router";
        type Type = super::Router;
        type ParentType = adw::Bin;

        fn class_init(klass: &mut Self::Class) {
            // Register new routes hear
        }
    }

    impl Router {
        fn install_route<R, T>(klass: &mut T)
        where
            T: gtk::subclass::widget::WidgetClassExt,
            R: Route + 'static,
        {
            let path = format!("navigation.visit.{}", R::route());
            let variant_type = R::Parameter::static_variant_type();
            let variant_type = variant_type.as_str();

            klass.install_action(&path, Some(variant_type), |this, _, variant| {
                let this = this.dynamic_cast_ref::<super::Router>().unwrap();
                let imp: &Router = this.imp();
                let variant = variant.and_then(|variant| variant.get::<R::Parameter>());
                let widget = R::build_page(variant);

                if R::is_top_level() {
                    imp.view.replace(&[widget]);
                } else {
                    imp.view.push(&widget);
                }
            });
        }
    }

    #[glib::derived_properties]
    impl ObjectImpl for Router {
        fn constructed(&self) {
            self.parent_constructed();
            self.obj().set_child(Some(&self.view));
        }
    }

    impl WidgetImpl for Router {}
    impl BinImpl for Router {}
}

glib::wrapper! {
    pub struct Router(ObjectSubclass<imp::Router>) @extends gtk::Widget, adw::Bin;
}

pub trait Route
where
    Self: glib::ObjectExt + 'static,
    Self::Parameter: glib::FromVariant,
{
    /// The type of the parameter that will be passed to the page
    /// this should be a tuple of the parameters that will be passed
    /// to the routes build function. The parameters need to be able
    /// to be serialized and deserialized as a Gio Variant
    type Parameter = ();

    /// The route that this page will be displayed at
    /// this should be a static string formatted with
    /// periods to separate the parts of the route
    /// instead of slashes
    fn route() -> &'static str;

    fn is_top_level() -> bool {
        false
    }

    /// This function should build the Widget that will be
    /// displayed when the route is navigated to
    fn build(parameter: Option<Self::Parameter>) -> impl IsA<gtk::Widget>;

    fn build_page(parameter: Option<Self::Parameter>) -> adw::NavigationPage;
}
