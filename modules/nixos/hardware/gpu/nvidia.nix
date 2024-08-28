{ lib, config, ... }:
let
  # only the newest nvidia package
  # nvStable = config.boot.kernelPackages.nvidiaPackages.stable;
  # nvBeta = config.boot.kernelPackages.nvidiaPackages.beta;

  inherit (config.modules) device;
  inherit (lib) mkIf;
in {
  config = mkIf (device.gpu == "nvidia") {
    # nvidia drivers kinda are unfree software
    nixpkgs.config.allowUnfree = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    boot.kernelParams = [ "module_blacklist=i915" ];

    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    hardware.enableAllFirmware = true;
  };
}
