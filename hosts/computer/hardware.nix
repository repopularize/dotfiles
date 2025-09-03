{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/38f61f69-a7dc-4bcc-a8fc-f5b34a41a3a7";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/80E9-6AFD";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  boot.kernelParams = [ "root=UUID=38f61f69-a7dc-4bcc-a8fc-f5b34a41a3a7" ];

  swapDevices = [ ];
}
