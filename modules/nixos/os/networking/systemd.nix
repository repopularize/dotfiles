{ lib, ... }:
let
  inherit (lib) concatMapAttrs genAttrs mkForce;
in
{
  systemd = {
    network.wait-online.enable = false;

    services = {
      NetworkManager-wait-online.enable = true;

      # disable networkd and resolved from being restarted on configuration changes
      systemd-networkd.stopIfChanged = false;
      systemd-resolved.stopIfChanged = false;
    };
  };
}
