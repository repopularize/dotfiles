{ pkgs, lib, config, ... }:
let
  inherit (lib) mkIf;
  sys = config.modules.system;
in {
  config = mkIf sys.video.enable {
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
      };
    };

    # benchmarking tools
    environment.systemPackages = with pkgs; [ glxinfo glmark2 ];
  };
}
