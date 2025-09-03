{
  programs.plasma.panels = [
    {
      location = "bottom";
      widgets = [
        "org.kde.plasma.kickoff"
        {
          name = "org.kde.plasma.icontasks";
          config = {
            launchers = [
              "applications:chromium-browser.desktop"
              "applications:Alacritty.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:vesktop.desktop"
              "applications:code.desktop"
              "applications:com.obsproject.Studio.desktop"
            ];
          };
        }
        "org.kde.plasma.systemtray"
        "org.kde.plasma.digitalclock"
      ];
      floating = true;
      minLength = 1743;
      maxLength = 1920;
      hiding = "dodgewindows";
    }
  ];
}
