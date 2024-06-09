{ inputs, lib, pkgs, config, osConfig, ... }:
let inherit (lib) mkIf isModernShell;
in {
  programs.atuin = mkIf (isModernShell osConfig) {
    enable = true;
    package = pkgs.atuin;

    enableBashIntegration = config.programs.bash.enable;
    enableFishIntegration = config.programs.fish.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableNushellIntegration = config.programs.nushell.enable;

    settings = {
      dialect = "us";
      style = "compact";
      show_preview = true;
      secrets_filter = true;
      common_prefix = [ "sudo" ];
    };
  };
}
