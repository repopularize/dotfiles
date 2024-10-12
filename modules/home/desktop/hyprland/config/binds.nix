{ lib, defaults, pkgs, ... }:
let
  inherit (lib.lists) optionals;

  mainMod = "SUPER";
  mainModS = "SUPER_SHIFT";
  mainModC = "SUPER_CTRL";
  launchMod = "ALT";
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # App launcher && other apps
      "${launchMod}, T, exec, ${defaults.terminal}"
      "${launchMod}, Q, exec, ${defaults.browser}"
      "${launchMod}, C, exec, ${defaults.editor}"
      "${launchMod}, L, exec, ${defaults.screenLocker}"

      # Screen Capturing
      ", Print, exec, screenshot-bind"
      "${mainMod}, Print, exec, screenshot-window-bind"
      "${mainModS}, S, exec, screenshot-quick-bind"

      # Workspace Keybinds
      "${mainModS}, d, movetoworkspace, +1"
      "${mainModS}, a, movetoworkspace, -1"
      "${mainMod}, d, workspace, +1"
      "${mainMod}, a, workspace, -1"

      # Move Focus keybinds
      "${mainModC}, a, movefocus, l"
      "${mainModC}, d, movefocus, r"
      "${mainModC}, s, movefocus, d"
      "${mainModC}, w, movefocus, u"

      # Window keybinds
      "${mainMod}, F, togglefloating"
      "${mainMod}, W, killactive"
    ] ++ optionals (defaults.bar == "waybar") [
      "${mainMod}, R, exec, wofi --show drun"
      "${mainMod}, escape, exec, wlogout"
      ''${mainMod}, dperiod, exec, BEMOJI_PICKER_CMD="wofi -d" bemoji''
      "${mainMod}, V, exec, ${lib.getExe pkgs.cliphist} list | ${
        lib.getExe pkgs.wofi
      } --dmenu | ${lib.getExe pkgs.cliphist} decode | ${
        lib.getExe' pkgs.wl-clipboard "wl-copy"
      }"
    ];

    # mouse binds
    bindm = [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"
    ];
  };
}
