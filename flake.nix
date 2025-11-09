{
  description = "Development shells for nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-unstable.follows = "nixpkgs-unstable";
    };
  };
  outputs = {
    self,
    nix-utils,
    ...
  }: let
    perSystem = nix-utils.lib.eachSystem {};
  in {
    checks = perSystem (
      pkgs: _: {
        deadnix = pkgs.runCommand "deadnix" {
          nativeBuildInputs = [pkgs.deadnix];
        } "deadnix --fail ${./.} && touch $out";
      }
    );
    formatter = perSystem (pkgs: _: pkgs.alejandra);
    overlays.default = _: prev: {
      YOUR-PACKAGE = self.packages.${prev.system}.default;
    };
    devShells = perSystem (
      pkgs: _: let
        inherit (pkgs.lib) removeSuffix;
        inherit (pkgs.lib.attrsets) mergeAttrsList;
        inherit (builtins) attrNames readDir;
        name = removeSuffix ".nix";
        shell = e: pkgs.callPackage (./shells + "/${e}") {};
      in
        mergeAttrsList (map (e: {"${name e}" = shell e;}) (attrNames (readDir ./shells)))
    );
    packages = perSystem (
      pkgs: _: {
        default = pkgs.hello;
      }
    );
  };
}
