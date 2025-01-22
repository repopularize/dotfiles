{ lib, osConfig, ... }:
let
  cfg = osConfig.modules.programs.gui.terminals.alacritty;

  family = "JetBrainsMono NF";
in
{
  programs.alacritty = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      window.opacity = 0.9;
      window.padding = {
        x = 16;
        y = 16;
      };

      font = {
        size = 11.0;

        normal = {
          inherit family;
          style = "Regular";
        };

        bold = {
          inherit family;
          style = "Bold";
        };

        italic = {
          inherit family;
          style = "Regular";
        };

        bold_italic = {
          inherit family;
          style = "Regular Bold";
        };
      };

      cursor.style = {
        shape = "Beam";
        blinking = "Off";
      };
    };
  };
}
