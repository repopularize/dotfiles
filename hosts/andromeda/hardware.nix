{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/112cd0a6-0202-4595-8097-9973698e0343";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/907B-9BCF";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];
}