{ pkgs }:
pkgs.mkShell {
  name = "java";
  packages = with pkgs; [ gradle maven openjdk ];
}
