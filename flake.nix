{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
    devshell.url = "github:numtide/devshell";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      haskell-flake,
      devshell,
      treefmt-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [
        haskell-flake.flakeModule
        devshell.flakeModule
        flake-parts.flakeModules.easyOverlay
        treefmt-nix.flakeModule
      ];

      perSystem =
        {
          self',
          pkgs,
          final,
          config,
          ...
        }:
        {
          treefmt.programs = {
            nixfmt.enable = true;
            fourmolu.enable = true;
            cabal-fmt.enable = true;
          };
          overlayAttrs = {
            janet-headers = pkgs.callPackage ./janet-headers.nix { };
          };
          devshells.commands = {
            env = [
              {
                name = "HTTP_PORT";
                value = 8080;
              }
            ];
            commands = [
              {
                help = "links the janet headers into the include dir";
                name = "link-janet";
                command = ''
                  echo "linking janet headers..."
                  mkdir ./include
                  ln -f -s ${final.janet-headers}/janet.h include/janet.h
                '';
              }
            ];
            packages = with pkgs; [
              janet
              jpm
            ];
          };

          haskellProjects.janet-hs = {
            devShell = {
              tools = hp: {
                fourmolu = hp.fourmolu;
                ghcid = null;
              };
              # Check that haskell-language-server works
              # hlsCheck.enable = true; # Requires sandbox to be disabled
            };
          };
          devShells.default = pkgs.mkShell {
            inputsFrom = [
              config.devShells.commands
              config.devShells.janet-hs
            ];
          };
          packages.default = self'.packages.example;
        };
    };
}
