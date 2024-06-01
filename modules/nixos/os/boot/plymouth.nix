{ lib, pkgs, config, inputs', ... }:
let
  inherit (pkgs) plymouth;
  inherit (lib) mkIf;

  cfg = config.modules.system.boot.plymouth;
in {
  config = mkIf cfg.enable {
    boot.plymouth = { enable = true; };

    # make plymouth work with sleep
    powerManagement = {
      powerDownCommands = ''
        ${plymouth} --show-splash
      '';
      resumeCommands = ''
        ${plymouth} --quit
      '';
    };
  };
}
