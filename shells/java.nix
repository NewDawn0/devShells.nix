{pkgs}:
pkgs.mkShell {
  name = "java";
  packages = with pkgs; [
    fastjar
    gradle
    maven
    openjdk
    jdk24
  ];
}
