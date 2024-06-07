{ lib, config, ... }:
let
  inherit (lib) mkIf mkDefault mkForce;

  dev = config.modules.device;
in
{
  imports = [
    # ./firewall

    # ./blocker.nix
    ./networkmanager.nix
    # ./optimize.nix
    # ./tailscale.nix
    # ./tcpcrypt.nix
  ];

  networking.useDHCP = mkDefault true;
}
