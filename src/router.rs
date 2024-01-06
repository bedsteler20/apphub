use adw::prelude::*;
use adw::subclass::prelude::*;
use glib::IsA;
use glib::VariantTy;
use once_cell::race::OnceBox;
use once_cell::sync::OnceCell;
use std::cell::Cell;
use std::cell::RefCell;

mod imp {

    use crate::widgets::CreateWeekRef;

    use super::*;

    #[derive(Default, Debug, glib::Properties)]
    #[properties(wrapper_type = super::Router)]
    pub struct Router {
        #[property(set, get)]
        pub view: RefCell<adw::NavigationView>,
        #[property(get, set)]
        pub can_go_back: Cell<bool>,
        #[property(set, get)]
        pub main_pages: RefCell<adw::ViewStack>,
        pub action_group: gio::SimpleActionGroup,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for Router {
        const NAME: &'static str = "Router";
        type Type = super::Router;
        type ParentType = adw::Bin;
    }

    #[glib::derived_properties]
    impl ObjectImpl for Router {
        fn constructed(&self) {
            self.parent_constructed();
            self.obj()
                .insert_action_group("router", Some(&self.action_group));

            let nav_view = adw::NavigationView::new();
            let obj = self.obj().week_ref();
            // When the nav view changes pages we need to update can_go_back
            nav_view.connect_visible_page_notify(move |nav_view| {
                let this = obj.upgrade().unwrap();
                let page = nav_view.visible_page().unwrap();
                this.set_can_go_back(nav_view.previous_page(&page).is_some());
            });

            // gtk gets angy when the view stack dose not have a parent
            // so we set the parent to the router evan tho it wont
            // actually be displayed
            let view_stack = adw::ViewStack::new();
            let obj = self.obj().week_ref();
            view_stack.connect_visible_child_notify(move |view_stack| {
                println!("view stack changed");
                let this = obj.upgrade().unwrap();
                let page = view_stack.visible_child_name().unwrap();
                unsafe {
                    this.navigate_to_unsafe(&page, None);
                }
            });
        }
    }

    impl WidgetImpl for Router {}
    impl BinImpl for Router {}
}

glib::wrapper! {
    pub struct Router(ObjectSubclass<imp::Router>) @extends gtk::Widget;
}

impl Router {
    pub fn add_route<R>(&self)
    where
        R: Route + 'static,
    {
        let variant: &VariantTy = &R::Parameter::static_variant_type().into_owned();
        // if the route is a tuple with no items then we don't need to
        // pass any parameters to the route. This is useful because
        // rusts "()" type is turned into a empty tuple when converted
        // to a variant
        let variant = if variant.is_tuple() && variant.n_items() == 0 {
            None
        } else {
            Some(variant)
        };

        let action = gio::SimpleAction::new(&format!("visit.{}", R::route()), variant);
        let imp = self.imp();
        let nav_view = imp.view.borrow().clone();
        let static_page = if R::is_static() {
            Some(R::build_page(None))
        } else {
            None
        };

        action.connect_activate(move |_, parameter| {
            let page = if let Some(static_page) = static_page.clone() {
                static_page
            } else {
                let variant = parameter.and_then(|variant| variant.get::<R::Parameter>());
                R::build_page(variant)
            };

            if R::is_top_level() {
                nav_view.replace(&[page]);
            } else {
                nav_view.push(&page);
            }
        });

        imp.action_group.add_action(&action);
    }

    pub fn add_main_route<R>(&self, title: &str, icon: &str)
    where
        R: Route + 'static,
    {
        self.imp().main_pages.borrow().add_titled_with_icon(
            &adw::Bin::new(),
            Some(R::route()),
            title,
            icon,
        );
        self.add_route::<R>();
    }

    pub fn navigate_to<R>(&self, parameter: Option<R::Parameter>)
    where
        R: Route + 'static,
    {
        self.imp().action_group.activate_action(
            &format!("visit.{}", R::route()),
            parameter.map(|parameter| parameter.to_variant()).as_ref(),
        );
    }

    pub unsafe fn navigate_to_unsafe(&self, route: &str, parameter: Option<glib::Variant>) {
        self.imp()
            .action_group
            .activate_action(route, parameter.as_ref());
    }
}

pub trait Route
where
    Self: glib::ObjectExt + 'static,
    Self::Parameter: glib::FromVariant + glib::ToVariant,
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

    fn is_static() -> bool {
        false
    }

    /// This function should build the Widget that will be
    /// displayed when the route is navigated to
    fn build(parameter: Option<Self::Parameter>) -> impl IsA<gtk::Widget>;

    fn build_page(parameter: Option<Self::Parameter>) -> adw::NavigationPage {
        adw::NavigationPage::builder()
            .title(Self::route())
            .child(&Self::build(parameter))
            .build()
    }
}
