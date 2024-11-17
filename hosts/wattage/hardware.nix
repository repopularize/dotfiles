{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e9902caf-9c25-4316-84a9-636b52b0d046";
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
