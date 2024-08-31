{ inputs', inputs, osConfig, lib, ... }:
let
  inherit (lib) mkIf;

  spicePkgs = inputs'.spicetify-nix.packages.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  config = mkIf (osConfig.modules.programs.gui.spotify.enable) {
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";

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
