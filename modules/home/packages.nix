{ pkgs, lib, inputs, osConfig, ... }:
let
  inherit (lib) optionals;
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  home.packages = optionals (osConfig.modules.programs.cli.enable)
    (with pkgs; [
      whois
      ngrok
      nixfmt
      yt-dlp
      fastfetch
    ]) ++ optionals (osConfig.modules.programs.gui.enable) (with pkgs; [
    tor-browser
    obsidian
    newsflash
    obs-studio
    icon-library
    fractal
    gimp
    krita
    piper
    protonvpn-gui
    (pkgs.prismlauncher.override { glfw = pkgs.glfw-wayland-minecraft; })
    g4music
    amberol
    kdePackages.kdenlive
    blender
    inkscape
    kdePackages.okular
  ]);
}
