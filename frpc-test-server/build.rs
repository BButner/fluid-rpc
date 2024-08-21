use std::{env, path::PathBuf};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let mut protos_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    protos_path.push("protos");

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());

    tonic_build::configure()
        .build_server(true)
        .build_client(false)
        .out_dir(&out_dir)
        .file_descriptor_set_path(out_dir.join("testserver.bin"))
        .compile(&[protos_path.join("foo.proto").as_path()], &[protos_path])?;

    Ok(())
}
