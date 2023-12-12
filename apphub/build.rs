use glib_build_tools::compile_resources;

fn main() {
    println!("cargo:rerun-if-changed=../data/apphub.gresource.xml");
    compile_resources(&["../data"], "../data/apphub.gresource.xml", "compiled.gresource");
}
