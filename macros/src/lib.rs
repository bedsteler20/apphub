//! Documentation: [https://docs.rs/gtk_widget_macro](https://docs.rs/gtk_widget_macro)
//!
//! crates.io: [https://crates.io/crates/gtk_widget_macro](https://crates.io/crates/gtk_widget_macro)
use proc_macro::TokenStream;
use quote::quote;
use syn::{self, Data, DeriveInput, Fields};

#[proc_macro_derive(GtkWidget, attributes(tmpl_ignore))]
pub fn gtk_widget_macro_derive(input: TokenStream) -> TokenStream {
    let ast = syn::parse(input).unwrap();
    impl_gtk_widget_macro(&ast)
}

fn impl_gtk_widget_macro(ast: &DeriveInput) -> TokenStream {
    let name = &ast.ident;
    // Add a input arg to the proc macro

    let fields = match &ast.data {
        Data::Struct(syn::DataStruct {
            fields: Fields::Named(fields),
            ..
        }) => &fields.named,
        _ => panic!("expected a struct with named fields"),
    };
    let field_name = fields.iter().map(|field| &field.ident);

    let gen = quote! {
        impl #name {
            fn new(builder: gtk::Builder) -> Self {
                Self {
                    #(
                        #field_name: builder.object(stringify!(#field_name)).expect(format!("gtk child {} not found", stringify!(#field_name)).as_str()),
                    )*
                }
            }
        }
    };
    gen.into()
}

