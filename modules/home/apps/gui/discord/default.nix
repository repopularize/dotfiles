{ osConfig
, lib
, pkgs
, ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf (osConfig.modules.programs.gui.discord.enable) {
    home.packages = [ (pkgs.vesktop.override { withSystemVencord = false; }) ];

    xdg.configFile."vesktop/settings/quickCss.css".source = ./theme.css;
    xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
  };
}
