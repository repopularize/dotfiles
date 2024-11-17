{
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib) optionals;
in
# unstable = import inputs.nixpkgs-unstable {
#   system = pkgs.system;
#   config.allowUnfree = true;
# };
{
  home.packages =
    optionals (osConfig.modules.programs.cli.enable) (
      with pkgs;
      [
        whois
        ngrok
        nixfmt-classic
        yt-dlp
        fastfetch
      ]
    )
    ++ optionals (osConfig.modules.programs.gui.enable) (
      with pkgs;
      [
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
        prismlauncher
        g4music
        amberol
        kdePackages.kdenlive
        blender
        inkscape
        kdePackages.okular
        pavucontrol
      ]
    );
}
