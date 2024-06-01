{ lib, ... }: {
  imports = [
    ./cpu # cpu-specific options (eg. setting if you have a amd or intel cpu)
    ./gpu # gpu-specific options (eg. setting if you have a intel, amd or nvidia gpu)
    ./media # sound and video configuration

    ./bluetooth.nix # bluetooth configuration
  ];
}
