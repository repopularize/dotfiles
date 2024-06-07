{ lib
, inputs
, pkgs
, osConfig
, ...
}:
let
  cfg = osConfig.modules.programs.gui.browsers.firefox;
in
{
  imports = [ inputs.schizofox.homeManagerModule ];
  config = lib.mkIf (cfg.enable && cfg.schizofox) {
    programs.schizofox = {
      enable = true;

      theme = {
        font = "Inter Variable";

        colors = {
          foreground = "cdd6f4";
          background = "1e1e2e";
          background-darker = "181825";
          primary = "#5e0dc";
        };

        extraUserChrome = ''
          .titlebar-buttonbox {
              display: none !important;
          }
          .titlebar-spacer {
              display: none !important;
          }
          :root {
              --tab-border-radius: 50px !important;
              --tabs-border-color: transparent !important;
          }
          #navigator-toolbox {
              border: 0px !important;
              background-color: #1e1e2e !important;
              color: #f5e0dc !important;
          }
          #TabsToolbar {
              margin-left: 35vw !important;
              background-color: #1e1e2e !important;
              color: #f5e0dc !important;
          }
          #nav-bar {
              background: transparent !important;
              margin-top: -38px !important;
              margin-bottom: 3px !important;
              margin-right: 65vw !important;
          }
          #urlbar-container {
              width: unset !important;
              min-width: 0px !important;
              transition: min-width 0.6s cubic-bezier(0.16, 1, 0.3, 1), transform 0.6s cubic-bezier(0.16, 1, 0.3, 1) !important;
              transition-property: min-width transform;
          }
          #nav-bar[urlbar-exceeds-toolbar-bounds="true"] #urlbar-container {
              min-width: 100vw !important;
              border: 0px none !important;
              transform: translateX(-112px);
              z-index: 999999 !important;
          }
          #urlbar-background, #searchbar {
              border: 0px none !important;
          }
          #urlbar {
              background: transparent !important;
              border: none !important;
              box-shadow: none !important;
          }
          #page-action-buttons {
              display: none !important;
          }
          #PanelUI-button {
              display: none !important;
          }
          #nav-bar:not([tabs-hidden="true"]) {
              box-shadow: none !important;
          }
          .tab-background {
            background-color: #1e1e2e;
            color: #f5e0dc !important;
          }'';
      };

      search = {
        defaultSearchEngine = "DuckDuckGo";
        removeEngines = [
          "Google"
          "Bing"
          "Amazon.com"
          "eBay"
          "Twitter"
          "Wikipedia"
        ];
        addEngines = [ ];
      };

      security = {
        sanitizeOnShutdown = false;
        sandbox = false;
      };

      extensions = {
        darkreader.enable = false;

        extraExtensions = {
          # Addon IDs are in manifest.json or manifest-firefox.json
          "vpn@proton.ch".install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
          "sponsorBlocker@ajay.app".install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/refined-github-/latest.xpi";
          "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
        };
      };
    };
  };
}
