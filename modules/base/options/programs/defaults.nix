{ lib, ... }:
let
  inherit (lib) mkOption types mdDoc;
in
{
  options.modules.programs.defaults = {
    terminal = mkOption {
      type = types.enum [
        "alacritty"
        "kitty"
        "wezterm"
        "foot"
      ];
      default = "wezterm";
    };

    fileManager = mkOption {
      type = types.enum [
        "thunar"
        "dolphin"
        "nemo"
        "nautilus"
      ];
      default = "dolphin";
    };

    browser = mkOption {
      type = types.enum [
        "chromium"
        "firefox"
      ];
      default = "firefox";
    };

    editor = mkOption {
      type = types.enum [
        "nvim"
        "code"
        "zed-editor"
      ];
      default = "code";
    };

    launcher = mkOption {
      type =
        with types;
        nullOr (enum [
          "fuzzel"
          "wofi"
        ]);
      default = "wofi";
    };

    bar = mkOption {
      type =
        with types;
        nullOr (enum [
          "waybar"
          "astal"
        ]);
      default = "astal";
    };

    screenLocker = mkOption {
      type =
        with types;
        nullOr (enum [
          "swaylock"
          "gtklock"
          "hyprlock"
        ]);
      default = "gtklock";
      description = mdDoc ''
        The lockscreen module to be loaded by home-manager.
      '';
    };

    noiseSuppressor = mkOption {
      type =
        with types;
        nullOr (enum [
          "rnnoise"
          "noisetorch"
        ]);
      default = "rnnoise";
      description = mdDoc ''
        The noise suppressor to be used for desktop systems with sound enabled.
      '';
    };
  };
}
