{ inputs'
, inputs
, osConfig
, lib
, ...
}:
let
  inherit (lib) mkIf;

  spicePkgs = inputs'.spicetify-nix.legacyPackages;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  config = mkIf (osConfig.modules.programs.gui.spotify.enable) {
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        adblock
        fullScreen
        beautifulLyrics
        featureShuffle
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
        lyricsPlus
        nameThatTune
        ncsVisualizer
        newReleases
        reddit
        betterLibrary
      ];
    };
  };
}
