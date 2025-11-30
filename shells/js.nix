{pkgs}:
pkgs.mkShell {
  name = "js";
  packages = with pkgs; [
    live-server
    nodePackages.nodemon
    nodePackages.npm
    nodejs
    typescript
  ];
}
