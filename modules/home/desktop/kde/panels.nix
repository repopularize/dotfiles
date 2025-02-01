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
              "preferred://browser"
              "applications:org.kde.konsole.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:vesktop.desktop"
              "applications:code.desktop"
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
