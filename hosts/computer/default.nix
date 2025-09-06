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
        hostname = "computer";
        mainUser = "user";
        autoLogin = true;

        boot = {
          loader = "systemd-boot";
          enableKernelTweaks = true;
          loadRecommendedModules = true;

          plymouth.enable = true;
        };

        fs = [
          "ext4"
          "vfat"
        ];

        video.enable = true;
        sound.enable = true;
        bluetooth.enable = true;
        printing.enable = true;

        virtualization = {
          enable = true;
          docker.enable = true;
          podman.enable = false;
          qemu.enable = true;
        };

        networking.tailscale.enable = true;
      };

      services.postgresql.enable = true;

      environment = {
        desktop = "KDE";
        loginManager = "sddm";
        useHomeManager = true;
      };

      programs = {
        cli.enable = true;
        tui.enable = true;
        agnostic.editors = {
          zed.enable = true;
        };
        gui = {
          enable = true;
          okular.enable = true;

          kdeconnect.enable = true;

          launchers.wofi.enable = true;
          bars = {
            waybar.enable = true;
            astal.enable = true;
          };

          browsers = {
            # arkenfox.enable = false;
            chromium = {
              enable = true;
              ungoogled = true;
            };
          };

          terminals = {
            foot.enable = false;
            alacritty.enable = true;
          }; # i gotta make konsole configuration

          fileManagers = {
            dolphin.enable = true;
          };
        };

        defaults = {
          terminal = "alacritty";
          fileManager = "dolphin";
          editor = "code";
          launcher = "wofi";
          bar = "astal";
          screenLocker = "gtklock";
          browser = "chromium";
        };
      };

      style = {
        gtk.enable = true;
        qt.enable = true;
      };
    };

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };


    services.mullvad-vpn.enable = true;
  };
}
