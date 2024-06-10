{
  imports = [ ./hardware.nix ];

  config = {
    modules = {
      device = {
        type = "desktop";
        cpu = "intel";
        gpu = "nvidia";

        monitors = [ "HDMI-A-1" "DVI-D-1" ];
        hasBluetooth = false; # my computer is so old :sob:
        hasSound = true;
      };

      system = {
        hostname = "andromeda";
        mainUser = "yusof";
        autoLogin = true;

        boot = {
          loader = "systemd-boot";
          enableKernelTweaks = true;
          loadRecommendedModules = true;

          plymouth.enable = false;

          initrd = {
            enableTweaks = true;
            optimizeCompressor = true;
          };
        };

        fs = [ "ext4" "vfat" ];

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

        networking.tailscale.enable = true;
      };

      environment = {
        desktop = "Hyprland";
        loginManager = "gdm";
        useHomeManager = true;
      };

      programs = {
        cli.enable = true;
        tui.enable = true;
        gui = {
          enable = true;
          okular.enable = true;

          launchers.wofi.enable = true;
          bars.waybar.enable = true;

          browsers = {
            firefox.enable = true;
            chromium.enable = true;
          };

          terminals = {
            foot.enable = true;
            kitty.enable = true;
          };

          fileManagers = { nautilus.enable = true; };
        };
        defaults = {
          terminal = "foot";
          fileManager = "nautilus";
          editor = "code";
          launcher = "wofi";
          bar = "waybar";
          screenLocker = "gtklock";
        };
      };

      style = {
        gtk.enable = true;
        qt.enable = true;
      };
    };
  };
}
