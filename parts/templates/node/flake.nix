{
  description = "Typescript + NodeJS project template";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };
  };

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: function nixpkgs.legacyPackages.${system}
        );
    in
    {
      packages = forAllSystems (pkgs: rec {
        example = pkgs.callPackage ./default.nix { };
        default = example;
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell
          {
            packages = with pkgs; [
              nodejs_latest # NodeJS runtime + NPM
              nodePackages_latest.pnpm # PNPM package manager
            ];
          };
      });

      overlays.default = final: _: { example = final.callPackage ./default.nix { }; };
    };
}
