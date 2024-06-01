{
  imports = [
    ./hardware # hardware options
    ./options # options, for configuring stuff quickly
    ./security # keeping the system safe
    # ./services # allows for per-system system services to be enabled TODO
    ./os # system configurations

    ./virtualization.nix # docker, QEMU, waydroid, and most importantly the machine's vmVariant for testing these dotfiles
    ./nh.nix # yet another nix helper config
    ./nix.nix # nix settings for nixos only systems
  ];
}