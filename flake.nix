{
  description = "Development shells for nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { utils, ... }: {
    devShells = utils.lib.eachSystem { } (pkgs:
      let
        shells = with builtins;
          pkgs.lib.genAttrs (map (e: pkgs.lib.removeSuffix ".nix" e)
            (attrNames (readDir ./shells)))
          (e: import (./shells + "/${e}.nix") { inherit pkgs; });
      in shells);
  };
}
