{ lib, config, ... }:
let
  cfg = config.modules.programs.gui.kdeconnect;
in
{
  programs.kdeconnect = lib.modules.mkIf cfg.enable {
    enable = true;
  };
}
