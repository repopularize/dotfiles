{ lib, config, ... }:
let
  inherit (lib) mkIf mkMerge;
  sys = config.modules.system;
in
{
  config = mkMerge [
    (mkIf (builtins.elem "ext4" sys.fs) {
      boot = {
        supportedFilesystems = [ "ext4" ];
        initrd = {
          supportedFilesystems = [ "ext4" ];
        };
      };
    })

    (mkIf (builtins.elem "exfat" sys.fs) {
      boot = {
        supportedFilesystems = [ "exfat" ];
        initrd = {
          supportedFilesystems = [ "exfat" ];
        };
      };
    })

    # accept both ntfs and ntfs3 as valid values
    (mkIf ((builtins.elem "ntfs" sys.fs) || (builtins.elem "ntfs3" sys.fs)) {
      boot = {
        supportedFilesystems = [ "ntfs" ];
      };
    })
  ];
}
