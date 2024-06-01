{ pkgs, lib, ... }:
let
  inherit (lib) mkOption mkEnableOption types;
in
{
  options.modules.system.security = {
    tor.enable = mkEnableOption "Tor daemon";
  };
}