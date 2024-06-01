{ lib, ... }:
let inherit (lib) concatMapAttrs genAttrs mkForce;
in {
  # systemd DNS resolver daemon
  services.resolved.enable = true;

  systemd = {
    # allow for the system to boot without waiting for the network interfaces are online
    network.wait-online.enable = false;

    services = {
      NetworkManager-wait-online.enable = false;

      # disable networkd and resolved from being restarted on configuration changes
      systemd-networkd.stopIfChanged = false;
      systemd-resolved.stopIfChanged = false;
    };
  };
}
