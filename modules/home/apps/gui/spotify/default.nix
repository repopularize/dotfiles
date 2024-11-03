{ inputs', inputs, osConfig, lib, pkgs, ... }:
let
  inherit (lib) mkIf;

  spicePkgs = inputs'.spicetify-nix.packages.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  config = mkIf (osConfig.modules.programs.gui.spotify.enable) {
    programs.spicetify =
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          adblock
          fullScreen
          genre
          shuffle
        ];

        enabledCustomApps = with spicePkgs.apps; [
          marketplace
          spicePkgs.official.apps.lyrics-plus
        ];
      };
  };
}
