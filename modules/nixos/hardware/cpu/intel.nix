{ lib, pkgs, config, ... }:
let inherit (config.modules) device;
in {
  config = lib.mkIf (device.cpu == "intel" || device.cpu == "vm-intel") {
    hardware.cpu.intel.updateMicrocode = true;

    boot = { kernelModules = [ "kvm-intel" ]; };

    environment.systemPackages = with pkgs; [ intel-gpu-tools ];
  };
}
