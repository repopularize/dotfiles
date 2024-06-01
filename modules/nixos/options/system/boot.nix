{ config, lib, pkgs, ... }:
let inherit (lib) literalExpression mkOption mkEnableOption types;
in {
  options.modules.system.boot = {
    enableKernelTweaks =
      mkEnableOption "security and performance related kernel parameters";
    recommendedLoaderConfig =
      mkEnableOption "tweaks for common bootloader configs per my liking";
    loadRecommendedModules =
      mkEnableOption "kernel modules that accommodate for most use cases";
    tmpOnTmpfs = mkEnableOption
      "`/tmp` living on tmpfs. false means it will be cleared manually on each reboot";

    kernel = mkOption {
      type = types.raw;
      default = pkgs.linuxPackages_latest;
      description = "The kernel to use for the system.";
    };

    initrd = {
      enableTweaks =
        mkEnableOption "quality of life tweaks for the initrd stage";
      optimizeCompressor = mkEnableOption ''
        initrd compression algorithm optimizations for size.
        Enabling this option will force initrd to use zstd (default) with
        level 19 and -T0 (STDIN). This will reduce thee initrd size greatly
        at the cost of compression speed.
        Not recommended for low-end hardware.
      '';
    };

    extraModprobeConfig = mkOption {
      type = types.str;
      default = "options hid_apple fnmode=1";
      description =
        "Extra modprobe config that will be passed to system modprobe config.";
    };

    silentBoot = mkEnableOption ''
      almost entirely silent boot process through `quiet` kernel parameter
    '' // {
      default = config.modules.system.boot.plymouth.enable;
    };

    extraKernelParams = mkOption {
      type = with types; listOf str;
      default = [ ];
    };

    extraModulePackages = mkOption {
      type = with types; listOf package;
      default = [ ];
      example =
        literalExpression "with config.boot.kernelPackages; [acpi_call]";
      description = "Extra kernel modules to be loaded.";
    };

    loader = mkOption {
      type = types.enum [ "none" "grub" "systemd-boot" ];
      default = "none";
      description = "The bootloader that should be used for the device.";
    };

    grub = {
      device = mkOption {
        type = with types; nullOr str;
        default = "nodev";
        description = "The device to install the bootloader to.";
      };
    };

    plymouth = { enable = mkEnableOption "plymouth boot splash"; };
  };
}
