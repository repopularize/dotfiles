{ pkgs, lib, osConfig, ... }:
let
  inherit (lib) optionalString;
  sys = osConfig.modules.system;
  cfg = osConfig.modules.programs;
in {
  config = lib.mkIf (lib.isWayland osConfig
    && osConfig.modules.programs.gui.bars.waybar.enable) {
      home.packages = with pkgs; [ wlogout ];

      programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        style = import ./style.nix { };
        settings = {
          mainBar = {
            layer = "top";
            position = "top";

            exclusive = true;
            passthrough = false;
            gtk-layer-shell = true;

            spacing = 5;

            margin-right = 8;
            margin-left = 8;

            modules-left = [ "hyprland/workspaces" "wlr/taskbar" ];
            modules-center = [ "custom/launcher" "hyprland/window" ];
            modules-right =
              [ "tray" "pulseaudio" "backlight" "battery" "clock" ];

            # modules
            "wlr/taskbar" = {
              "format" = "{icon}";
              "icon-size" = 20;
              "icon-theme" = "Star";
              "tooltip-format" = "{title}";
              "on-click" = "minimize";
              "on-click-middle" = "close";
              "on-click-right" = "activate";
            };

            "hyprland/workspaces" = {
              disable-scroll = true;
              all-outputs = true;
              sort-by-number = true;
              on-click = "activate";
              format = "{icon}";
              format-icons = {
                "1" = "一";
                "2" = "二";
                "3" = "三";
                "4" = "四";
                "5" = "五";
                "6" = "六";
                "7" = "七";
                "8" = "八";
                "9" = "九";
                "10" = "十";
              };
              persistent-workspaces = {
                "1" = [ ];
                "2" = [ ];
                "3" = [ ];
                "4" = [ ];
                "5" = [ ];
              };
            };
            tray = {
              icon-size = 13;
              spacing = 10;
            };
            clock = {
              format = " {:%r}";
              tooltip-format = ''
                <big>{:%Y %B}</big>
                <tt><small>{calendar}</small></tt>'';
            };
            pulseaudio = {
              format = "{icon} {volume}%";
              tooltip = false;
              format-muted = "󰝟";
              on-click = "pamixer -t";
              on-scroll-up = "pamixer -i 5";
              on-scroll-down = "pamixer -d 5";
              scroll-step = 5;
              format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = [ "" "" "" ];
              };
            };

            "pulseaudio#microphone" = {
              format = "{format_source}";
              format-source = " {volume}%";
              format-source-muted = " Muted";
              on-click = "pamixer --default-source -t";
              on-scroll-up = "pamixer --default-source -i 5";
              on-scroll-down = "pamixer --default-source -d 5";
              scroll-step = 5;
            };

            network = {
              interface = "wlo1";
              format-wifi = "";
              format-ethernet = "";
              tooltip-format = "{essid} ({signalStrength}%)";
              format-linked = "{ifname} (No IP) ";
              format-disconnected = "⚠";
              format-alt = "{ifname} = {ipaddr}/{cidr}";
            };
            backlight = {
              tooltip = false;
              format = "{icon} {percent}%";
              format-icons = [ "" "" "" "" "" "" "" "" "" ];
              interval = 1;
              on-scroll-up = "brightnessctl set 1%- -q";
              on-scroll-down = "brightnessctl set 1%+ -q";
            };
            battery = {
              states = {
                good = 95;
                warning = 30;
                critical = 20;
              };
              format = "{icon} {capacity}%";
              format-charging = " {capacity}%";
              format-plugged = " {capacity}%";
              format-alt = "{time} {icon}";
              format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            };
            bluetooth = {
              format = "";
              format-connected-battery = " {icon}";
              battery = {
                states = {
                  good = 95;
                  warning = 30;
                  critical = 20;
                };
                format = "{icon} {capacity}%";
                format-charging = " {capacity}%";
                format-plugged = " {capacity}%";
                format-alt = "{time} {icon}";
                format-icons = [ "" "" "" "" "" "" "" "" "" "" "" ];
              };
              tooltip-format = ''
                {controller_alias}	{controller_address}
                {status}'';
              tooltip-format-off = ''
                {controller_alias}	{controller_address}
                {status}'';
              tooltip-format-connected = ''
                {controller_alias}	{controller_address}
                {num_connections} {status}
                {device_enumerate}'';
              tooltip-format-enumerate-connected =
                "{device_alias}	{device_address}";
              tooltip-format-enumerate-connected-battery =
                "{device_alias}	{device_address}	{device_battery_percentage}%";
              format-icons = {
                default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
              };
              on-click = "$term -e bluetoothctl";
              on-click-right = "killall bluetoothctl";
              on-scroll-up = "bluetoothctl power on";
              on-scroll-down = "bluetoothctl power off";
            };
            "custom/logout" = {
              format = " ";
              on-click = "wlogout --protocol layer-shell -b 5 -T 400 -B 400";
              on-right-click =
                "wlogout --protocol layer-shell -b 5 -T 400 -B 400";
              tooltip = false;
            };
            "custom/launcher" = {
              format = "";
              on-click = "wofi --show drun";
              on-click-right = "wofi --show drun";
            };
            gamemode = {
              format = "󰊴";
              format-alt = "{glyph}";
              glyph = "󰊴";
              hide-not-running = true;
              use-icon = true;
              icon-name = "input-gaming-symbolic";
              icon-spacing = 4;
              icon-size = 20;
              tooltip = true;
              tooltip-format = "Games running: {count}";
            };
          };
        };
      };
    };
}
