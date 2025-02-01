{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkDefault optionals;

  sys = config.modules.system.networking;
  cfg = sys.tailscale;
in
{
  config = mkIf cfg.enable {
    # make the tailscale command usable to users
    environment.systemPackages = [ pkgs.tailscale ];

    # enable tailscale, inter-machine VPN service
    services.tailscale = {
      enable = true;
      useRoutingFeatures = mkDefault "server";
      extraUpFlags =
        sys.tailscale.defaultFlags
        ++ optionals sys.tailscale.enable [ "--advertise-exit-node" ];
    };

    # server can't be client and client be server
    assertions = [
      (mkIf (cfg.isClient == cfg.isServer) {
        assertion = false;
        message = ''
          You have enabled both client and server features of the Tailscale service. Unless you are providing your own UpFlags, this is probably not what you want.
        '';
      })
    ];
  };
}
