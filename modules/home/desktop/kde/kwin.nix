{ pkgs, ... }: {
  home.packages = [ pkgs.kde-rounded-corners ];

  programs.plasma.kwin = {
    effects = {
      wobblyWindows.enable = true;
      blur.enable = true;
      desktopSwitching.animation = "slide";
    };
  };

  programs.plasma.configFile = {
    "kwinrc"."Round-Corners"."ActiveOutlineAlpha" = 255;
    "kwinrc"."Round-Corners"."InactiveCornerRadius" = 9;
    "kwinrc"."Round-Corners"."InactiveOutlineAlpha" = 255;
    "kwinrc"."Round-Corners"."InactiveOutlineColor" = "17,17,27";
    "kwinrc"."Round-Corners"."InactiveSecondOutlineColor" = "203,166,247";
    "kwinrc"."Round-Corners"."InactiveSecondOutlineThickness" = 1;
    "kwinrc"."Round-Corners"."OutlineColor" = "203,166,247";
    "kwinrc"."Round-Corners"."OutlineThickness" = 1.5;
    "kwinrc"."Round-Corners"."SecondOutlineColor" = "17,17,27";
    "kwinrc"."Round-Corners"."SecondOutlineThickness" = 1.5;
    "kwinrc"."Round-Corners"."Size" = 9;
  };
}
