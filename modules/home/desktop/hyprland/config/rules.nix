{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # https://wiki.hyprland.org/Useful-Utilities/Screen-Sharing/#xwayland
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "nofocus,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"

      # Wofi
      "opacity 0.7,class:^(wofi)$"
      "opacity 0.9,class:^(code-url-handler)"
    ];
  };
}
