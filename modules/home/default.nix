{
  imports = [
    ./desktop # desktop programs / wm configurations
    ./apps # application configurations (eg. terminal emulators, code editors, etc.)
    ./system # system configuration like xdg and stuff

    ./packages.nix # packages that do not need config, or do not use home manager
  ];
}
