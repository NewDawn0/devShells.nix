{ pkgs }:
pkgs.mkShell {
  name = "mac";
  buildInputs = with pkgs;
    builtins.attrValues darwin.apple_sdk.frameworks
    ++ [ darwin.libobjc darwin.libiconv pkg-config ];
}
