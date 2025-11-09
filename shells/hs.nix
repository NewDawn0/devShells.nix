{pkgs}:
pkgs.mkShell {
  name = "haskell";
  packages = with pkgs; [cabal-install ghc ormolu];
}
