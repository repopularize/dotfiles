{ inputs, pkgs, lib, osConfig, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  config = lib.mkIf
    (lib.isWayland osConfig
      && osConfig.modules.programs.gui.bars.astal.enable)
    {
      programs.ags = {
        enable = true;
        configDir = ./config;

        extraPackages = with pkgs; [
          inputs.ags.packages.${pkgs.system}.battery
          fzf
        ];
      };
    };
}
