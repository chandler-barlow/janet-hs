{ pkgs ? import <nixpkgs> {} }:
let 
  janet-headers = pkgs.callPackage ./janet-headers.nix {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    cabal-install
    ghc
    janet
    jpm
  ];
  shellHook = ''
    echo "linking janet headers..."
    ln -s ${janet-headers}/janet.h include/janet.h
  '';
}
