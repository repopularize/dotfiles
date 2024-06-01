{ pkgs, ... }:
let
  inherit (config.modules) environment;
  manager = environment.loginManager;
in {
  services.xserver = {
    enable = (manager == "gdm" || manager == "lightdm");
    displayManager = {
      gdm.enable = manager == "gdm";
      lightdm.enable = manager == "lightdm";
    };

    excludePackages = [ pkgs.xterm ];
  };
}
