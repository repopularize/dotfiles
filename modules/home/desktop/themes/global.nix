{ lib, osConfig, ... }:
let
  cfg = osConfig.modules.style.pointerCursor;
in
{
  config = {
    # pointer / cursor theming
    home.pointerCursor = {
      package = cfg.package;
      name = cfg.name;
      size = cfg.size;
      gtk.enable = true;
      x11.enable = !(lib.isWayland osConfig);
    };
  };
}
