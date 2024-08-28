{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      follow_mouse = 1;
      sensitivity = -0.8; # -1.0 - 1.0, 0 means no modification.
      numlock_by_default = true; # numlock enable

      # swap caps lock and escape
      # kb_options = "caps:swapescape";

      touchpad = {
        tap-to-click = true;
        natural_scroll = false; # this is not natural
        disable_while_typing = false; # this is annoying
      };
    };

    cursor = { no_hardware_cursors = true; };
  };
}
