{ pkgs, ... }: {

  programs.plasma.configFile."spectaclerc" = {
    GuiConfig."captureMode" = 0;
    General = {
      "autoSaveImage" = true;
      "clipboardGroup" = "PostScreenshotCopyImage";
      "useReleaseToCapture" = true;
      "launchAction" = "UseLastUsedCapturemode";
    };
    ImageSave."translatedScreenshotsFolder" = "Screenshots";
    VideoSave."translatedScreencastsFolder" = "Screencasts";
  };
  programs.plasma.spectacle.shortcuts = {
    captureRectangularRegion = "Meta+Shift+S";
    captureEntireDesktop = "Shift+Print";
  };
}
