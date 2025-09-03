{ lib
, pkgs
, config
, ...
}:
let
  inherit (lib) mkIf isModernShell;
in
{
  programs = {
    # less pager
    less.enable = true;

    bash.promptInit = mkIf (isModernShell config) ''
      eval "$(${lib.getExe pkgs.starship} init bash)"
    '';
  };

  environment.systemPackages = [ pkgs.comma ];
}
