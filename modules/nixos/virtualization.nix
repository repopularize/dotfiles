{ lib, config, pkgs, ... }:
let
  inherit (lib) optionals mkIf concatLists;
  sys = config.modules.system;
  cfg = sys.virtualization;
in {
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;
      concatLists [
        (optionals cfg.qemu.enable [ virt-manager virt-viewer ])
        (optionals cfg.docker.enable [ podman podman-compose ])
        (optionals (cfg.docker.enable && sys.video.enable) [ lxd ])
        (optionals cfg.waydroid.enable [ waydroid ])
      ];

    virtualisation = {
      # qemu
      kvmgt.enable = true;
      spiceUSBRedirection.enable = true;

      libvirtd = mkIf cfg.qemu.enable {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          ovmf = {
            enable = true;
            packages = [ pkgs.OVMFFull.fd ];
          };
          swtpm.enable = true;
        };
      };

      # podman
      podman = mkIf (cfg.docker.enable || cfg.podman.enable) {
        enable = true;
        dockerCompat = true;
        dockerSocket.enable = true;
        defaultNetwork.settings = { dns_enabled = true; };
        autoPrune = {
          enable = true;
          flags = [ "--all" ];
          dates = "weekly";
        };
      };

      # waydroid config
      waydroid.enable = cfg.waydroid.enable;
      lxd.enable = cfg.waydroid.enable;

      containers.cdi.dynamic.nvidia.enable = true;

      vmVariant = {
        # good for testing this machine configuration
        services.qemuGuest.enable = true;
        boot = {
          kernelParams =
            [ "systemd.show_status=true" "systemd.log_level=debug" ];
        };
        virtualisation = {
          qemu.options = [
            "-enable-kvm"
            "-display gtk,gl=on,zoom-to-fit=on,grab-on-hover=on"
            "-device virtio-vga-gl"
            "-device usb-mouse"
            "-device usb-tablet"
            "-device usb-kbd"
          ];
          diskSize = 16000;
          memorySize = 4096;
          cores = 4;
          writableStoreUseTmpfs = false;
        };
      };
    };
  };
}
