{ lib, inputs, ... }:
let
  inherit (inputs) self;

  # mkSystem is a helper function that wraps lib.nixosSystem
  mkSystem = lib.nixosSystem;

  # mkNixSystem is a function that uses withSystem to give us inputs' and self'
  # it also assumes the the system type either nixos or darwin and uses the appropriate
  mkNixSystem =
    {
      host,
      deployable ? false,
      modules,
      system,
      withSystem,
      ...
    }@args:
    withSystem system (
      { inputs', self', ... }:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      lib.mkMerge [
        {
          "nixosConfigurations".${args.host} = mkSystem {
            inherit (args) system;
            modules = [
              # depending on the base operating system we can only use some options therefore these
              # options means that we can limit these options to only those given operating systems
              "${self}/modules/nixos"
              inputs.home-manager.nixosModules.home-manager

              # configurations based on that are imported based hostname
              "${self}/hosts/${args.host}"
              {
                config = {
                  modules.system.hostname = args.host;
                  nixpkgs.hostPlatform = lib.mkDefault args.system;
                };
              }
            ] ++ args.modules or [ ];
            specialArgs = {
              inherit
                lib
                inputs
                self
                inputs'
                self'
                ;
            } // args.specialArgs or { };
          };
        }
      ]
    );

  # mkNixosIso is a helper function that wraps mkSystem to create an iso
  # DO NOT use mkNixSystem here as it is overkill for isos, furthermore we cannot use darwinSystem here
  mkNixosIso =
    {
      host,
      system,
      modules,
      ...
    }@args:
    {
      nixosConfigurations.${args.host} = mkSystem {
        inherit (args) system;
        specialArgs = {
          inherit inputs lib self;
        } // args.specialArgs or { };
        modules = [
          # get an installer profile from nixpkgs to base the Isos off of
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel.nix"
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"

          "${self}/modules/iso"
          { config.networking.hostName = args.host; }
        ] ++ args.modules or [ ];
      };

      images.${args.host} = self.nixosConfigurations.${args.host}.config.system.build.isoImage;
    };

  # mkSystems is a wrapper for mkNixSystem to create a list of systems
  mkSystems = systems: lib.mkMerge (map mkNixSystem systems);

  # mkNixosIsos likewise to mkSystems is a wrapper for mkNixosIso to create a list of isos
  mkNixosIsos = isos: lib.mkMerge (map mkNixosIso isos);
in
{
  inherit mkSystems mkNixosIsos;
}