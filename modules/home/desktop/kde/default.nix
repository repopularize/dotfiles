{ inputs, osConfig, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./apps
    ./workspace.nix
    ./panels.nix
    ./fonts.nix
    ./kwin.nix
  ];

  programs.plasma.enable = if osConfig.modules.environment.desktop == "KDE" then true else false;
}
