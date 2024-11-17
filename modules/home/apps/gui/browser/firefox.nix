{
  inputs,
  pkgs,
  osConfig,
  lib,
  ...
}:
let
  cfg = osConfig.modules.programs.gui.browsers.firefox;
  font = "Inter";
  background = "262626";
  background-darker = "161616";
  foreground = "#ffffff";
  primary = "#78a9ff";
  border = "#525252";
in
{
  imports = [ inputs.arkenfox.hmModules.arkenfox ];

  config = lib.mkIf (cfg.enable) {
    programs.firefox = {
      enable = true;
      arkenfox = {
        enable = true;
        version = "126.0";
      };

      profiles.default = {
        isDefault = true;
        name = "default";
        id = 0;
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          multi-account-containers
          firefox-color
          violentmonkey
          stylus
          ublock-origin
          ublacklist
          darkreader
          proton-pass
          decentraleyes
          clearurls
          youtube-shorts-block
        ];

        arkenfox = {
          enable = true;
          "0000".enable = true; # about:config warning disabled
          "0100" = {
            # Clear default topsites and disable sponsored content but keep new tab page
            enable = true;
            "0102"."browser.startup.page".value = 1;
            "0103"."browser.startup.homepage".value = "about:home";
            "0104"."browser.newtabpage.enabled".value = true;
          };
          "0200" = {
            # Switch to Mozilla geolocation service and disable OS's built in geolocation service.
            enable = true;
            "0202"."geo.provider.use_gpsd".value = true;
          };
          "0300".enable = true; # Disable telemetry and all recommendation
          "0400".enable = true; # Disable safe browsing remotely checking downloads
          "0700" = {
            # DNS / DoH / PROXY / SOCKS
            enable = true;
            "0710"."network.trr.mode".enable = true;
            "0712"."network.trr.uri" = {
              enable = true;
              value = "https://mozilla.cloudflare-dns.com/dns-query";
            };
          };
          "0900".enable = true; # Disable Firefox password auto capture
          "1200".enable = true; # HTTPS only
          "1600".enable = true; # Less cross-origin information sent
          "1700".enable = true; # Enable Container Tabs
        };

        settings = {
          "browser.tabs.firefox-view" = false; # Disable Firefox View
          "extensions.pocket.enabled" = false; # Disable Pocket
          "browser.newtabpage.activity-stream.feeds.topsites" = false; # Disable Shortcuts on home page
          "browser.toolbars.bookmarks.visibility" = "never"; # Hide bookmark bar
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false; # Disable Pocket recommendations on new tab page
          "signon.rememberSignons" = false; # Do not save passwords in Firefox
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customisation
          "browser.compactmode.show" = true;
          "browser.uidensity" = 1;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
          "browser.urlbar.suggest.topsites" = false;
          "browser.urlbar.suggest.trending" = false;
          "browser.urlbar.suggest.weather" = false;
          "browser.urlbar.suggest.yelp" = false;
          "browser.urlbar.suggest.pocket" = false;
          "browser.urlbar.suggest.mdn" = false;
          "browser.urlbar.suggest.engines" = false;
        };

        userChrome = ''
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
          }
          #TabsToolbar {
              margin-left: 35vw !important;
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
              background-color: ${background-darker};
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
        '';

        userContent = ''
          @-moz-document url-prefix("about:") {
            * {
              font-family: "${font}" !important;
            }

            html {
              background: #${background-darker};
            }

            :root {
              --in-content-page-background: #${background-darker} !important;
              --in-content-page-color: #${foreground} !important;

              --in-content-text-color: #${foreground} !important;

              --in-content-box-background: #${background} !important;
              --in-content-box-info-background: #${background} !important;
              --in-content-box-border-color: #${border} !important;

              --in-content-table-background: #${background} !important;

              --newtab-background-color: #${background-darker} !important;
              --newtab-background-color-secondary: #${background} !important;
              --newtab-text-primary-color: #${foreground} !important;
              --newtab-primary-element-text-color: #${background-darker} !important;
              --newtab-primary-action-background: #${primary} !important;

              --brand-color-accent: #${primary} !important;
              --color-accent-primary-hover: #${primary} !important;
              --color-accent-primary-active: #${primary} !important;

              --in-content-primary-button-background: #${primary} !important;
              --in-content-primary-button-background-active: #${primary} !important;
              --in-content-primary-button-background-hover: #${primary} !important;
              --in-content-primary-button-text-color: #${background-darker} !important;

              --checkbox-unchecked-bgcolor: #${background} !important;
              --checkbox-unchecked-hover-bgcolor: #${background} !important;

              --in-content-button-background: #${background} !important;
              --in-content-button-background-hover: #${background} !important;

              --card-shadow: transparent !important;
            }

            .search-wrapper .logo-and-wordmark .wordmark {
              fill: #${foreground} !important;
            }

            .checkbox-check[checked] {
              color: #${background-darker} !important;
            }

            html|button[autofocus], html|button[type="submit"], xul|button[default], button.primary {
              background-color: #${primary} !important;
            }

            panel {
              --panel-background: #${background} !important;
              --panel-color: #${foreground} !important;
            }

            panel-list {
              background: #${background} !important;
            }

            input[type="checkbox"]:enabled:checked,
            input[type="checkbox"]:enabled:checked:hover {
              background-color: #${primary} !important;
            }

            #trackingProtectionShield {
              color: #${primary} !important;
            }

            .dialogBox {
              background-color: #${background-darker} !important;
            }

            dialog {
              background-color: #${background-darker} !important;
              color: #${foreground} !important;
            }

            .privacy-detailedoption {
              background-color: #${background} !important;
            }

            .addon-detail-actions input[type="radio"]:not(:checked) {
              background-color: #${background-darker} !important;
            }

            .theme-enable-button {
              background-color: #${background-darker} !important;
            }

            .toggle-button {
              --toggle-background-color: #${background-darker} !important;
              --toggle-background-color-hover: #${background-darker} !important;
              --toggle-background-color-active: #${background-darker} !important;
              --toggle-border-color: #${foreground} !important;
            }
          }
        '';
      };
    };
  };
}
