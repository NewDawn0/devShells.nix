{ pkgs }:
pkgs.mkShell {
  name = "go";
  packages = with pkgs; [ go ];
}
