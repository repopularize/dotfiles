{ inputs
, pkgs
, osConfig
, lib
, ...
}:
let
  inherit (lib) mkIf mkForce;
in
{
  config = mkIf (osConfig.modules.programs.agnostic.editors.vscode.enable) {
    home.packages = with pkgs; [
      nil
      nixpkgs-fmt
      biome
    ];

    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      # https://github.com/nix-community/home-manager/issues/4394#issuecomment-1712909231
      mutableExtensionsDir = true;
      userSettings = import ./settings.nix { inherit lib pkgs; };
      extensions = mkForce (pkgs.callPackage ./extensions.nix {
        extensions =
          (inputs.vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion pkgs.vscode-fhs.version).vscode-marketplace;
      });
    };
  };
}
