{ lib, config, ... }:
let
  inherit (lib) mkIf mkForce;
  inherit (config.modules) device;
in
{
  imports = [ ./hardware.nix ];

  config = {
    modules = {
      device = {
        type = "desktop";
        cpu = "intel";
        gpu = "nvidia";

        monitors = [
          "HDMI-A-1"
          "DVI-D-1"
        ];
        hasBluetooth = false; # my computer is so old :sob:
        hasSound = true;
      };

      system = {
        mainUser = "yusof";

        boot = {
          loader = "grub";
          enableKernelTweaks = true;
          loadRecommendedModules = true;

          plymouth.enable = true;

          initrd = {
            enableTweaks = true;
            optimizeCompressor = true;
          };
        };

        fs = [
          "ext4"
          "vfat"
        ];

        video.enable = true;
        sound.enable = true;
        bluetooth.enable = false;
        printing.enable = true;

        virtualization = {
          enable = true;
          docker.enable = true;
          podman.enable = true;
          qemu.enable = true;
        };
      };

      environment = {
        desktop = "Hyprland";
        useHomeManager = true;
      };

      programs = {
        cli.enable = true;
        tui.enable = true;
        gui = {
          enable = true;
          okular.enable = true;

          launchers.rofi.enable = true;
          bars.waybar.enable = true;

          browsers.firefox = {
            enable = true;
          };

          terminals = {
            foot.enable = true;
            kitty.enable = true;
          };

          fileManagers = {
            nautilus.enable = true;
          };
        };
        defaults = {
          terminal = "foot";
          fileManager = "nautilus";
          editor = "code";
          launcher = "rofi";
          bar = "waybar";
          screenLocker = "gtklock";
        };
      };
    };

    hardware.nvidia =
      mkIf
        (builtins.elem device.gpu [
          "nvidia"
        ])
        {
          open = mkForce false; # open source drivers are kind of a pain in the ass
        };
  };
}
