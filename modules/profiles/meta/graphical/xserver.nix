{ pkgs, config, ... }:
let
  inherit (config.modules) environment;
  manager = environment.loginManager;
in {
  services.xserver = {
    enable = manager == "gdm";
    displayManager = {
      gdm.enable = manager == "gdm";
      lightdm.enable = manager == "lightdm";
    };

    excludePackages = [ pkgs.xterm ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam.gamescopeSession.enable = true;
}
