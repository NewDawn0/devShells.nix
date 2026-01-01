{
  description = "On the fly development environments";

  inputs = {
    utils.url = "github:NewDawn0/nixUtils";
  };
  outputs = {
    self,
    utils,
    ...
  }: let
    concatWith = fk: fv: target: builtins.foldl' (xs: x: xs // {"${fk x}" = fv x;}) {} target;
    shells = with builtins; attrNames (readDir ./shells);
    fn = pkgs: {
      name = pkgs.lib.removeSuffix ".nix";
      toPkg = x: pkgs.callPackage ./shells/${x} {};
      toEnv = x: let
        pkg = fn.toPkg x;
      in
        pkgs.buildEnv {
          name = "dev-shell-env-${pkg.name}";
          paths = pkg.nativeBuildInputs;
        };
    };
  in {
    checks = utils.lib.eachSystem {} (
      p:
        with p; {
          deadnix = pkgs.runCommand "deadnix" {
            nativeBuildInputs = [pkgs.deadnix];
          } "deadnix --fail ${./.} && touch $out";
          typos = pkgs.runCommand "typos" {
            nativeBuildInputs = [pkgs.typos];
          } "typos --format brief && touch $out";
        }
    );
    lib = {
      inherit concatWith shells fn;
    };
    formatter = utils.lib.eachSystem {} (p: p.pkgs.alejandra);
    overlays.default = _: prev: let
      inherit (fn prev) name toEnv;
    in {
      dev-shell-env = concatWith name toEnv shells;
    };
    packages = utils.lib.eachSystem {} (
      p: let
        inherit (fn p.pkgs) name toPkg;
      in
        concatWith name toPkg shells
    );
    devShells = utils.lib.eachSystem {} (
      p: let
        inherit (fn p.pkgs) name toPkg;
      in
        concatWith name toPkg shells
    );
  };
}
