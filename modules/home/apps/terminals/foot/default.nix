{ lib, osConfig, ... }:
let inherit (osConfig.modules) programs;
in {
  config = lib.mkIf programs.gui.terminals.foot.enable {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = "JetBrainsMono NF:size=11";
          font-bold = "JetBrainsMono NF:style=ExtraBold:size=11";
          font-italic = "JetBrainsMono NF:style=Italic:size=11";
        };

        cursor = {
          style = "beam";
          beam-thickness = 1.5;
          underline-thickness = 2.3;
        };

        colors.alpha = 0.5;
      };
    };
  };
}
