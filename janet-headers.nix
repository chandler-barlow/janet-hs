{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "janet-header";
  src = builtins.fetchGit {
    url = "https://github.com/janet-lang/janet.git";
    name = "janet-source";
    rev = "84bb84b0b7e0884db0aaeab14b5982a04655289c";
    ref = "master";
  };
  buildPhase = ''
    mkdir $out
    make build/janet.h
    cp ./build/janet.h $out
  '';
  dontInstall = true;
}
