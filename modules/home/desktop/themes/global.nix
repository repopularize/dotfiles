{ lib, pkgs, inputs, osConfig, ... }:
let cfg = osConfig.modules.style;
in {
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  config = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "rosewater";

      pointerCursor = {
        enable = true;
        accent = "dark";
      };
    };

    # pointer / cursor theming
    home.pointerCursor = {
      size = 24;
      gtk.enable = true;
      x11.enable = !(lib.isWayland osConfig);
    };
  };
}
