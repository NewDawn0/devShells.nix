{pkgs}:
pkgs.mkShell {
  name = "js";
  packages = with pkgs; [
    nodePackages.live-server
    nodePackages.nodemon
    nodePackages.npm
    nodejs
    typescript
  ];
}
