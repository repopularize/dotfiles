{ lib, pkgs, osConfig, ... }:
let
  inherit (lib) mkIf optionals;
  inherit (osConfig.modules) device;
  cfg = osConfig.modules.style;

  acceptedTypes = [ "laptop" "desktop" "hybrid" "lite" ];

  qtctConfig = (pkgs.formats.ini { }).generate "qtct.conf" {
    Appearance.icon_theme = "breeze-dark";
  };
in {
  config =
    mkIf (builtins.elem device.type acceptedTypes && pkgs.stdenv.isLinux) {
      qt = {
        enable = true;
        platformTheme = "qtct";
        style = {
          name = "kvantum";
          package = with pkgs; [
            qt6Packages.qtstyleplugin-kvantum
            libsForQt5.qtstyleplugin-kvantum
            kdePackages.breeze-icons
            # "Since Qt 5.1 SVG support has moved into a module." - ArchWiki
            kdePackages.qtsvg
            libsForQt5.qt5.qtsvg
          ];
        };
      };

      xdg.configFile = {
        "qt6ct/qt6ct.conf".source = qtctConfig;
        "qt5ct/qt5ct.conf".source = qtctConfig;

        "Kvantum/kvantum.kvconfig".source =
          (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
            General.theme = "Catppuccin-Mocha-Mauve";
          };

        "Kvantum/Catppuccin-Mocha-Mauve".source = "${
            pkgs.catppuccin-kvantum.override {
              accent = "Mauve";
              variant = "Mocha";
            }
          }/share/Kvantum/Catppuccin-Mocha-Mauve";
      };

      home.sessionVariables = {
        # scaling - 1 means no scaling
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";

        # use wayland as the default backend, fallback to xcb if wayland is not available
        QT_QPA_PLATFORM = "wayland;xcb";

        # disable window decorations everywhere
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

        # remain backwards compatible with qt5
        DISABLE_QT5_COMPAT = "0";

        # tell calibre to use the dark theme
        CALIBRE_USE_DARK_PALETTE = "1";
      };
    };
}
