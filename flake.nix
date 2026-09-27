{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
    devshell.url = "github:numtide/devshell";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    hs-bindgen.url = "github:well-typed/hs-bindgen";
    janet-source = {
      url = "github:janet-lang/janet";
      flake = false;
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      haskell-flake,
      devshell,
      treefmt-nix,
      hs-bindgen,
      janet-source,
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
          system,
          ...
        }:
        let
          janet-headers = pkgs.stdenv.mkDerivation {
            name = "janet-headers";
            src = janet-source;
            buildPhase = ''
              mkdir $out
              make build/janet.h
              cp ./build/janet.h $out
            '';
            dontInstall = true;
          };
        in
        {
          _module.args.pkgs = import self.inputs.nixpkgs {
            inherit system;
            overlays = [
              # we need this so that we can have access
              # to the bindgen runtime library
              hs-bindgen.outputs.overlays.default
              # cabal2nix (via haskell-flake) auto-resolves
              # `extra-libraries: X` to a nixpkgs attribute literally named
              # `X`; nixpkgs calls this one `libffi`, not `ffi` (the
              # correct cabal/linker name, `-lffi`).
              (_final: prev: { ffi = prev.libffi; })
            ];
            config.allowUnfree = true;
          };
          treefmt.programs = {
            nixfmt.enable = true;
            fourmolu.enable = true;
            cabal-fmt.enable = true;
          };
          overlayAttrs = {
            inherit janet-headers;
            inherit (hs-bindgen.outputs.packages."${system}") hs-bindgen-cli;
          };
          devshells.commands = {
            commands = [
              {
                help = "links the janet headers into the include dir";
                name = "link-janet";
                command = ''
                  ROOT=$(git rev-parse --show-toplevel)
                  echo "linking janet headers..."
                  mkdir -p $ROOT/include
                  ln -f -s ${final.janet-headers}/janet.h $ROOT/include/janet.h
                '';
              }
              {
                help = "generate the janet header bindings";
                name = "generate-bindings";
                command = ''
                  ROOT=$(git rev-parse --show-toplevel)
                  $ROOT/generate-bindings.sh
                '';
              }
            ];
            packages = with final; [
              janet
              jpm
              hs-bindgen-cli
              libffi
            ];
            devshell.startup.bootstrap-janet-bindings = {
              text = ''
                ROOT=$(git rev-parse --show-toplevel)
                mkdir -p "$ROOT/include"
                ln -f -s ${final.janet-headers}/janet.h "$ROOT/include/janet.h"
                # bindings/Generated is gitignored: it's regenerated
                # deterministically from include/janet.h, not checked in.
                # Only bootstrap it here if it's missing; run the
                # `generate-bindings` command by hand to refresh it.
                if [ ! -f "$ROOT/bindings/Generated/Janet.hs" ]; then
                  echo "bootstrapping janet bindings (bindings/Generated is gitignored)..."
                  "$ROOT/generate-bindings.sh"
                fi
              '';
            };
          };

          haskellProjects.janet-hs = {
            devShell = {
              tools = hp: {
                fourmolu = hp.fourmolu;
                ghcid = null;
              };
            };
            settings = {
              janet-ffi = {
                extraLibraries = hp: [ pkgs.janet ];
              };
            };
          };
          devShells.default = pkgs.mkShell {
            inputsFrom = [
              config.devShells.commands
              config.devShells.janet-hs
            ];
          };
          packages = { };
        };
    };
}
