{ pkgs ? import <nixpkgs> {} }:
let 
  janet-headers = pkgs.callPackage ./janet-headers.nix {};
  janet-hs = pkgs.haskellPackages.developPackage { 
    name = "janet-hs";
    root = ./.; 
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
        [ cabal-install
          ghc
        ]);
    # returnShellEnv = true; 
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    janet
    jpm
  ];
  inputsFrom = [ janet-hs ];
  shellHook = ''
    echo "linking janet headers..."
    ln -f -s ${janet-headers}/janet.h include/janet.h
  '';
}
