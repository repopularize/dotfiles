{
  inputs,
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  config = lib.mkIf (lib.isWayland osConfig && osConfig.modules.programs.gui.bars.astal.enable) {
    home.packages = [ inputs.ags.packages.${pkgs.system}.astal3 ];

    programs.ags = {
      enable = true;
      configDir = ./gtk3;

      extraPackages = with pkgs; [
        inputs.ags.packages.${pkgs.system}.hyprland
        inputs.ags.packages.${pkgs.system}.mpris
        inputs.ags.packages.${pkgs.system}.network
        inputs.ags.packages.${pkgs.system}.wireplumber
        inputs.ags.packages.${pkgs.system}.tray
        inputs.ags.packages.${pkgs.system}.apps
        dart-sass
        fd
        fzf
      ];
    };
  };
}
