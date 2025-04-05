{
  description = "Your awesome flake";

  inputs.utils.url = "github:NewDawn0/nixUtils";

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
