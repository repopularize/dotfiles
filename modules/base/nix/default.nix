{
  imports = [
    ./environment.nix # environment settings that nix requires
    ./nix.nix # nix the package manager's settings
    ./nixpkgs.nix # nixpkgs configuration
    ./substituters.nix # nixpkgs substituters
  ];

  system.stateVersion = "24.05";
}
