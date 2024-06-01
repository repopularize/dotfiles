{ lib, ... }:
{
  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.utf-8";

    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
    ];
  };
}