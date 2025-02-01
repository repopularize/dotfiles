{ pkgs, ... }: {
  home.packages = [ (pkgs.catppuccin-kde.override { flavour = [ "mocha" ]; accents = [ "mauve" ]; }) ];

  programs.plasma.workspace = {
    clickItemTo = "select";
    enableMiddleClickPaste = true;


    wallpaperBackground.blur = true;
    cursor = {
      theme = "catppuccin-mocha-mauve-cursors";
      size = 24;
    };
    colorScheme = "CatppuccinMochaMauve";
    # windowDecorations = {
    #   library = "org.kde.breeze";
    # };
    wallpaper = ../wallpapers/earth.png;
  };
}
