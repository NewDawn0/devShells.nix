{ pkgs }:
pkgs.mkShell {
  name = "cpp";
  packages = with pkgs; [ gcc gnumake libcxxStdenv clang clang-tools ];
}
