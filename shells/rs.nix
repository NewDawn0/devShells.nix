{ pkgs }:
pkgs.mkShell {
  name = "rust";
  packages = with pkgs; [
    cargo-binstall
    cargo-expand
    cargo-flamegraph
    cargo-make
    cargo-update
    cargo-workspaces
    maturin
    rust-cbindgen
    rustup
    wabt
    wasm-pack
  ];
}
