{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 12;

    active_opacity = 1;
    inactive_opacity = 0.9;
    fullscreen_opacity = 1.0;

    drop_shadow = false; # off for now
    shadow_range = 10;
    "col.shadow" = "rgb(cba6f7)";
    "col.shadow_inactive" = "rgb(b4befe)";

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
