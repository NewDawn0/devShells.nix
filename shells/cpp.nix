{ pkgs }:
pkgs.mkShell {
  name = "cpp";
  packages = with pkgs; [ clang clang-tools gcc gdb gnumake libcxxStdenv ];
}
