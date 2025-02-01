{ pkgs, ... }: {
  programs.konsole = {
    enable = true;

    profiles = {
      "catppuccin" = {

        name = "catppuccin";
        colorScheme = "Catppuccin-Mocha";
        command = "${pkgs.nushell}/bin/nu";
        font = {
          name = "JetBrains Mono Nerd Font";
          size = 11;
        };
      };
    };

    defaultProfile = "catppuccin";

    customColorSchemes = {
      "Catppuccin-Mocha" = ./catppuccin-mocha.colorscheme;
    };
  };
}
