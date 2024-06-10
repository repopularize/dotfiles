{ lib, pkgs, config, ... }:
let
  browser = [
    "text/html"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/ftp"
    "x-scheme-handler/about"
    "x-scheme-handler/unknown"
  ];

  code = [
    "application/json"
    "text/english"
    "text/plain"
    "text/x-makefile"
    "text/x-c++hdr"
    "text/x-c++src"
    "text/x-chdr"
    "text/x-csrc"
    "text/x-java"
    "text/x-moc"
    "text/x-pascal"
    "text/x-tcl"
    "text/x-tex"
    "application/x-shellscript"
    "text/x-c"
    "text/x-c++"
  ];

  media = [ "video/*" "audio/*" ];

  images = [ "image/*" ];

  associations = (lib.genAttrs code (_: [ "code.desktop" ]))
    // (lib.genAttrs media (_: [ "mpv.desktop" ]))
    // (lib.genAttrs images (_: [ "okular.desktop" ]))
    // (lib.genAttrs browser (_: [ "schizofox.desktop" ])) // {
      "x-scheme-handler/discord" = [ "vesktop.desktop" ];
      "inode/directory" = [ "nautilus.desktop" ];
    };

in {
  home.packages = with pkgs; [ xdg-utils ];

  xdg = {
    enable = true;

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs = {
      enable = true;
      createDirectories = true;

      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      desktop = "${config.home.homeDirectory}/Desktop";
      videos = "${config.home.homeDirectory}/Media/Videos";
      music = "${config.home.homeDirectory}/Media/Music";
      pictures = "${config.home.homeDirectory}/Media/Pictures";

      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
        XDG_DEV_DIR = "${config.home.homeDirectory}/Development";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };
}
