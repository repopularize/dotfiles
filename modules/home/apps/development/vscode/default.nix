{ inputs
, pkgs
, osConfig
, lib
, ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf (osConfig.modules.programs.agnostic.editors.vscode.enable) {
    home.file.".vscode-oss/argv.json" = {
      force = true;
      text = builtins.toJSON {
        password-store = "gnome-libsecret";
        enable-crash-reporter = false;
        enable-proposed-api = [ "jeanp413.open-remote-ssh" ];
      };
    };

    home.packages = with pkgs; [
      nil
      nixpkgs-fmt
      wakatime-cli
      biome
    ];

    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      # https://github.com/nix-community/home-manager/issues/4394#issuecomment-1712909231
      mutableExtensionsDir = true;
      userSettings = import ./settings.nix { inherit lib pkgs; };
      extensions = pkgs.callPackage ./extensions.nix {
        extensions =
          (inputs.vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscode.version).vscode-marketplace;
      };
    };
  };
}
