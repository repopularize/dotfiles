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
          inputs.ags.packages.${pkgs.system}.hyprland
          inputs.ags.packages.${pkgs.system}.mpris
          inputs.ags.packages.${pkgs.system}.network
          inputs.ags.packages.${pkgs.system}.wireplumber
          inputs.ags.packages.${pkgs.system}.tray
          fzf
        ];
      };
    };
}
