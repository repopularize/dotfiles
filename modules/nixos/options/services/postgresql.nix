{ lib, ... }: {
  options.modules.services.postgresql = {
    enable = lib.mkEnableOption "Enable postgres";
  };
}
