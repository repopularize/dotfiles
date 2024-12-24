{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/de1b271b-7b49-4e1c-8110-b7eceba0cb3e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5237-844D";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ ];
}
