{
  pkgs,
  lib,
  config,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # packages necessary for thunar thumbnails
    xfce.tumbler
    libgsf # of files
    ffmpegthumbnailer
    ark # GUI archiver for thunar archive plugin
  ];

  programs = {
    # the thunar file manager
    # we enable thunar here and add plugins instead of in systemPackages
    thunar = lib.mkIf config.modules.programs.gui.fileManagers.thunar.enable {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };

    dconf.enable = true;

    # gnome's keyring manager
    # seahorse.enable = true;

    # # networkmanager tray uility, pretty useful actually (disabled because I can make my own)
    # nm-applet.enable = config.programs.waybar.enable;
  };
}
