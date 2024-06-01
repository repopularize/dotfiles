{ lib, ... }:
let inherit (lib) mkOption types mdDoc;
in {
  options.modules.programs.defaults = {
    terminal = mkOption {
      type = types.enum [ "alacritty" "kitty" "wezterm" "foot" ];
      default = "wezterm";
    };

    fileManager = mkOption {
      type = types.enum [ "thunar" "dolphin" "nemo" "nautilus" ];
      default = "thunar";
    };

    browser = mkOption {
      type = types.enum [ "schizofox" "chromium" ];
      default = "schizofox";
    };

    editor = mkOption {
      type = types.enum [ "nvim" "code" ];
      default = "nvim";
    };

    launcher = mkOption {
      type = with types; nullOr (enum [ "rofi" "wofi" ]);
      default = "rofi";
    };

    bar = mkOption {
      type = with types; nullOr (enum [ "waybar" "ags" ]);
      default = "waybar";
    };

    screenLocker = mkOption {
      type = with types; nullOr (enum [ "swaylock" "gtklock" "hyprlock" ]);
      default = "gtklock";
      description = mdDoc ''
        The lockscreen module to be loaded by home-manager.
      '';
    };

    noiseSuppressor = mkOption {
      type = with types; nullOr (enum [ "rnnoise" "noisetorch" ]);
      default = "rnnoise";
      description = mdDoc ''
        The noise suppressor to be used for desktop systems with sound enabled.
      '';
    };
  };
}
