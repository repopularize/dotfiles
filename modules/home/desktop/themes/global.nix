{ lib
, osConfig
, inputs
, ...
}:
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  config = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";

      cursors = {
        enable = true;
        accent = "mauve";
      };

      alacritty.enable = true;
    };

    # pointer / cursor theming
    home.pointerCursor = {
      size = 24;
      gtk.enable = true;
      x11.enable = !(lib.isWayland osConfig);
    };
  };
}
