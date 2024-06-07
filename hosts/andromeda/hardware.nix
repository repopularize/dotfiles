{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/fd114e6c-dc55-4c75-b79f-0ed5c171b470";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/48AC-CD7E";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];
}
