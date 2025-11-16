{
  description = "On the fly development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    utils,
    ...
  }: {
    checks = utils.lib.eachSystem {} (
      p:
        with p; {
          deadnix = pkgs.runCommand "deadnix" {
            nativeBuildInputs = [pkgs.deadnix];
          } "deadnix --fail ${./.} && touch $out";
        }
    );
    formatter = utils.lib.eachSystem {} (p: p.pkgs.alejandra);
    overlays.default = _: prev: {
      YOUR-PACKAGE = self.packages.${prev.system}.default;
    };
    devShells = utils.lib.eachSystem {} (
      p: let
        shells = with builtins; attrNames (readDir ./shells);
        name = p.pkgs.lib.removeSuffix ".nix";
        pkg = x: p.pkgs.callPackage ./shells/${x} {};
      in
        builtins.foldl' (xs: x: xs // {"${name x}" = pkg x;}) {} shells
    );
  };
}
