{pkgs}:
pkgs.mkShell {
  name = "asm";
  packages = with pkgs; [binutils nasm gcc];
}
