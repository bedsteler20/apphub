use proc_macro::TokenStream;
use quote::quote;
use syn::{self, Data, DeriveInput, Fields, Type};

#[proc_macro_derive(GtkTemplate, attributes(str))]
pub fn gtk_template(input: TokenStream) -> TokenStream {
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
    let field_type = fields.iter().map(|field| &field.ty);

    let gen = quote! {
        impl #name {
            fn new(builder: gtk::Builder) -> Self {
                Self {
                    #(
                        #field_name: builder.object(stringify!(#field_name)).unwrap(),
                    )*
                }
            }
        }
    };
    gen.into()
}
