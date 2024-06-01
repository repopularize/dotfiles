{ lib, pkgs, ... }: {
  users.users.root = lib.mkIf pkgs.stdenv.isLinux {
    initialHashedPassword =
      "$y$j9T$H.9WDN8Jvme/CQACIm9Bm0$FULU0Iq0kE5MUQOavyBrClQS3jTbF4A6ix9aw9QKNk3";

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMQDiHbMSinj8twL9cTgPOfI6OMexrTZyHX27T8gnMj2"
    ];
  };
}
