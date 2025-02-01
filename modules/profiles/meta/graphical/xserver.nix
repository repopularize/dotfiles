{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (config.modules) environment;
  manager = environment.loginManager;
  desktop = environment.desktop;
in
{
  services = {
    displayManager = {
      sddm.enable = manager == "sddm";
    };
    desktopManager = {
      plasma6.enable = desktop == "KDE";
    };
    xserver = {
      enable = manager == "gdm";
      excludePackages = [ pkgs.xterm ];
    };
  };

  programs.hyprland = {
    enable = desktop == "Hyprland";
    xwayland.enable = desktop == "Hyprland";
  };

  services.displayManager.defaultSession = if desktop == "KDE" then "plasma" else null;

  programs.steam.gamescopeSession.enable = true;
}
