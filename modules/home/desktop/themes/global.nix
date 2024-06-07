{ lib
, pkgs
, inputs
, osConfig
, ...
}:
let
  cfg = osConfig.modules.style;
in
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  config = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "rosewater";
    };

    # pointer / cursor theming
    home.pointerCursor = {
      inherit (cfg.pointerCursor) name package size;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
