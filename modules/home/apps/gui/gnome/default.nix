{ pkgs, osConfig, lib, ... }:
let inherit (lib) optionals;
in {
  home.packages = optionals (osConfig.modules.programs.gui.enable) (with pkgs; [
    nautilus # nautilus file explorer
    sushi # nautilus file previewer thingy
    gnome.gnome-weather # i still kinda use this i guess
  ]);
}
