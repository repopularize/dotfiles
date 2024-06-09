{ lib, pkgs, config, osConfig, defaults, inputs', ... }:
let
  inherit (lib) imap0 optionalString optionals;
  inherit (osConfig.modules) environment;
  pointer = config.home.pointerCursor;
in {
  config = lib.mkIf (environment.desktop == "Hyprland") {
    home.packages = with pkgs; [ hyprpicker bemoji swww cliphist ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs'.hyprland.packages.hyprland;
      xwayland.enable = true;

      systemd = {
        enable = true;
        variables = [ "--all" ];
        extraCommands = [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };

      settings = {
        monitor = [
          "HDMI-A-1,1920x1080@180.00,auto,1"
          "DVI-D-1,1440x900@75.03,auto,1"
        ];

        exec-once = [
          "wl-paste --type text --watch cliphist store" # Stores only text data
          "wl-paste --type image --watch cliphist store" # Stores only image data
          "wlsunset -S 8:00 -s 20:00"
          "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
          "${lib.getExe pkgs.swww} init && ${lib.getExe pkgs.swww} img ${
            ../wallpapers/yusof.png
          }"
        ] ++ optionals (defaults.bar == "waybar") [ "waybar" ];

        general = {
          gaps_in = 10;
          gaps_out = 20;
          border_size = 1;
          "col.active_border" = "rgb(f5e0dc) rgb(f5e0dc) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };

        decoration = {
          rounding = 0;
          blur = {
            enabled = true;
            size = 3;
            passes = 2;
          };
          drop_shadow = true;
          shadow_range = 5;
          shadow_render_power = 9;
          "col.shadow" = "rgba(1a1a1aee)";
          inactive_opacity = 0.9;
        };

        animations = {
          enabled = true;
          bezier = [ "bez, 0.16, 1, 0.3, 1" ];
          animation = [
            "windows, 1, 7, bez, slide"
            "windowsOut, 1, 7, bez, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, bez"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { new_is_master = true; };

        gestures = {
          # macOS style workspace switching
          workspace_swipe = true;
        };

        misc = {
          # Disables default wallpaper
          disable_hyprland_logo = true;
        };

        bind = import ./binds.nix { inherit pkgs lib defaults; };
        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "SUPER, mouse:272, movewindow"
          "SUPER_ALT, mouse:272, resizewindow"
          "SUPER, mouse:273, resizewindow"
        ];
        windowrulev2 = import ./rules.nix;
      };
    };
  };
}
