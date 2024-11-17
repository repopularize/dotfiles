{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs = {
    # type "fuck" to fix the last command that made you go "fuck"
    thefuck.enable = true;

    # help manage android devices via command line
    adb.enable = true;

    # show network usage
    bandwhich.enable = true;

    # enable direnv integration
    direnv = {
      enable = true;
      silent = true;
      # faster, persistent implementation of use_nix and use_flake
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv.override { nix = config.nix.package; };
      };

      # enable loading direnv in nix-shell nix shell or nix develop
      loadInNixShell = true;
    };
  };
}
