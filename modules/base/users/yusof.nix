{ lib, pkgs, config, self, ... }:
let inherit (lib) ifTheyExist;
in {
  users.users.yusof = {
    home = "/home/yusof";
    shell = pkgs.nushell;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "video" "audio" ]
      ++ ifTheyExist config [ "docker" "postgres" ];
    initialHashedPassword =
      "$y$j9T$H.9WDN8Jvme/CQACIm9Bm0$FULU0Iq0kE5MUQOavyBrClQS3jTbF4A6ix9aw9QKNk3";
  };
}
