{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 12;

    active_opacity = 0.8;
    inactive_opacity = 0.7;
    fullscreen_opacity = 1.0;

    shadow = {
      enabled = false;

      color = "rgb(cba6f7)";
      color_inactive = "rgb(1e1e2e)";
    };

    blur = {
      enabled = true;
      passes = 3;
      size = 4;

      brightness = 1;
      contrast = 1.3;
      noise = 1.17e-2;
      ignore_opacity = true;

      new_optimizations = true;
      xray = true;
    };
  };
}
