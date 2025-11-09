{pkgs}:
pkgs.mkShell {
  name = "zig";
  packages = with pkgs; [zig];
}
