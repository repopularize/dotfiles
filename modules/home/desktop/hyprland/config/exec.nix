{ pkgs, lib, config, defaults, ... }:
let
  inherit (lib) optionals;
  pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-paste --type text --watch cliphist store" # Stores only text data
      "wl-paste --type image --watch cliphist store" # Stores only image data
      "wlsunset -S 8:00 -s 20:00"
      "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
      "${lib.getExe pkgs.swww} init && ${lib.getExe pkgs.swww} img ${
        ../../wallpapers/wallpaper.png
      }"
    ] ++ optionals (defaults.bar == "waybar") [ "waybar" ];
  };
}
