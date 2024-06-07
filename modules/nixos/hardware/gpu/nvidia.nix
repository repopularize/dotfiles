{ lib, pkgs, config, ... }:
let
  # only the newest nvidia package
  nvStable = config.boot.kernelPackages.nvidiaPackages.stable;
  nvBeta = config.boot.kernelPackages.nvidiaPackages.beta;

  inherit (config.modules) device;
  inherit (lib) mkIf mkMerge mkDefault isWayland;
in
{
  config = mkIf (device.gpu == "nvidia") {
    # nvidia drivers kinda are unfree software
    nixpkgs.config.allowUnfree = true;

    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
    boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

    boot.kernelParams = [ "module_blacklist=i915" ];

    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = nvBeta;
    };

    hardware.enableAllFirmware = true;
  };
}
