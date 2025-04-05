{ pkgs }:
pkgs.mkShell {
  name = "fetch";
  packages = with pkgs; [
    nix-prefetch
    nix-prefetch-docker
    nix-prefetch-git
    nix-prefetch-github
  ];
}
