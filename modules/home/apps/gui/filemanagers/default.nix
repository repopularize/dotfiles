{ pkgs
, osConfig
, lib
, ...
}:
let
  inherit (lib) optionals mkIf;

  gui = osConfig.modules.programs.gui;
  fileManagers = gui.fileManagers;
in
{
  config = mkIf (gui.enable) {
    home.packages = [ ] ++ optionals (fileManagers.nautilus.enable) [ pkgs.nautilus ] ++ optionals (fileManagers.nautilus.enable) [ pkgs.dolphin ] ++ optionals (fileManagers.nautilus.enable) [ pkgs.nemo ];
  };
}
