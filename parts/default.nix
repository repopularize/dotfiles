{
  imports = [
    ./args.nix # add pkgs argument so we can import pkgs from anywhere in the dotfiles

    ./systems.nix # system architectures for these dotfiles

    ./modules # outputed nixos and home-manager modules
    ./lib # the lib that is used throughout system and home

    ../hosts # add more hosts to nixos

    ./packages # some packages i want to export
    ./overlays # flake overlays
    ./templates # some project templates so with flakes
  ];
}
