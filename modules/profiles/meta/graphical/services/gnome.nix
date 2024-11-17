{ lib, pkgs, ... }:
{
  services = {
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

    gnome = {
      glib-networking.enable = true;
      evolution-data-server.enable = true;
      gnome-online-accounts.enable = true;
      gnome-keyring.enable = true;

      # stupid thing i want disabled
      gnome-remote-desktop.enable = lib.mkForce false;
    };
  };
}
