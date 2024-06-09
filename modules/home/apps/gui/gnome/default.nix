{ pkgs, osConfig, lib, ... }:
let inherit (lib) optionals;
in {
  home.packages = optionals (osConfig.modules.programs.gui.enable) (with pkgs; [
    gnome.nautilus # nautilus file explorer
    gnome.sushi # nautilus file previewer thingy
    gnome.gnome-weather # i still kinda use this i guess
  ]);
}
