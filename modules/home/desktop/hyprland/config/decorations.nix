{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 12;

    active_opacity = 0.9;
    inactive_opacity = 0.8;
    fullscreen_opacity = 1.0;

    drop_shadow = false; # off for now
    shadow_range = 10;
    "col.shadow" = "rgb(ffffff)";
    "col.shadow_inactive" = "rgb(000000)";

    blur = {
      enabled = true;
      passes = 3;
      size = 4;

      brightness = 1;
      contrast = 1.3;
      noise = 1.17e-2;
      ignore_opacity = true;

      new_optimizations = true;
      xray = false;
    };
  };
}
