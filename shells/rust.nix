{ pkgs }:
pkgs.mkShell {
  name = "rust";
  packages = with pkgs; [
    cargo-binstall
    cargo-expand
    cargo-make
    cargo-update
    cargo-workspaces
    rustup
  ];
}
