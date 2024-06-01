{
  imports = [
    ./systems.nix # system architectures for these dotfiles

    ./modules # outputed nixos and home-manager modules
    ./lib # the lib that is used throughout system and home
  ];
}
