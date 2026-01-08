{pkgs}:
pkgs.mkShell {
  name = "rust";
  packages = with pkgs; [
    cargo-binstall
    cargo-expand
    cargo-flamegraph
    cargo-make
    cargo-update
    cargo-watch
    cargo-workspaces
    maturin
    openssl
    pkg-config
    rust-cbindgen
    rustup
    wasm-pack
  ];
}
