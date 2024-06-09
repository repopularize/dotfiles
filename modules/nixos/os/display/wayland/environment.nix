{ lib, config, ... }:
let
  inherit (lib) mkIf isWayland mkDefault;

  env = config.modules.environment;
in {
  config = mkIf (isWayland config) {
    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        GDK_BACKEND = "wayland,x11";
        ANKI_WAYLAND = "1";
        MOZ_ENABLE_WAYLAND = "1";
        XDG_SESSION_TYPE = "wayland";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";

        WLR_NO_HARDWARE_CURSORS = "1";
        WLR_DRM_DEVICES = mkDefault "/dev/dri/card1";
      };
    };
  };
}
