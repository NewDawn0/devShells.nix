{
  description = "On the fly development environments";

  inputs = {
    utils.url = "github:NewDawn0/nixUtils";
  };
  outputs =
    {
      self,
      utils,
      ...
    }:
    {
      checks = utils.lib.eachSystem { } (
        p: with p; {
          deadnix = pkgs.runCommand "deadnix" {
            nativeBuildInputs = [ pkgs.deadnix ];
          } "deadnix --fail ${./.} && touch $out";
          typos = pkgs.runCommand "typos" {
            nativeBuildInputs = [ pkgs.typos ];
          } "typos --format brief && touch $out";
        }
      );
      formatter = utils.lib.eachSystem { } (p: p.pkgs.alejandra);
      overlays.default = _: prev: {
        YOUR-PACKAGE = self.packages.${prev.system}.default;
      };
      devShells = utils.lib.eachSystem { } (
        p:
        let
          shells = with builtins; attrNames (readDir ./shells);
          name = p.pkgs.lib.removeSuffix ".nix";
          pkg = x: p.pkgs.callPackage ./shells/${x} { };
        in
        builtins.foldl' (xs: x: xs // { "${name x}" = pkg x; }) { } shells
      );
    };
}
