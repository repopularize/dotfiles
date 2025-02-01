{
  inputs,
  pkgs,
  osConfig,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf (osConfig.modules.programs.agnostic.editors.zed.enable) {
    home.packages = [
      pkgs.zed-editor
    ];

    xdg.configFile."zed/settings.json".source = ./config.json;
  };
}
