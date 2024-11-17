{ self, ... }:
let
  mkModule =
    path: if builtins.isPath path then self + path else builtins.throw "${path} does not exist";
in
{
  flake = {
    nixosModules = {
      # i do not provide a default module, so throw an error
      default = builtins.throw "There is no default module.";
    };

    # Currently there are no darwin modules
    darwinModules = {
      default = builtins.throw "There is no default module.";
    };

    homeManagerModules = {
      gtklock = mkModule /modules/extra/home-manager/gtklock.nix;

      default = builtins.throw "There is no default module.";
    };
  };
}
