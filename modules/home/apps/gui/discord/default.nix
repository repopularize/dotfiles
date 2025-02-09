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
    home.packages = [ (pkgs.equibop.override { withSystemVencord = false; }) ];

    xdg.configFile."equibop/settings/quickCss.css".source = ./theme.css;
    xdg.configFile."equibop/settings/settings.json".source = ./settings.json;
  };
}
