{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  inherit (lib) mkDefault;
in
{
  config = {
    # reload system units when changing configs
    systemd.user.startServices = mkDefault "sd-switch"; # or "legacy" if "sd-switch" breaks again

    home = {
      username = "user";
      homeDirectory = "/home/user";

      stateVersion = mkDefault "24.05";
    };

    # let HM manage itself when in standalone mode
    programs.home-manager.enable = true;

    # git config

    programs.git = {
      userName = "repopularize";
      userEmail = "9@sexi.st";
    };
  };
}
