{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 12;

    active_opacity = 0.9;
    inactive_opacity = 0.8;
    fullscreen_opacity = 1.0;

    drop_shadow = true; # off for now
    "col.shadow" = "rgb(161616)";
    "col.shadow_inactive" = "rgb(262626)";

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
