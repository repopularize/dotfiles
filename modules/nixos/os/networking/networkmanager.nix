{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf mkForce;

  dev = config.modules.device;
  sys = config.modules.system;
in
{
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];

  networking.networkmanager.enable = true;
}
