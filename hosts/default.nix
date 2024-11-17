{ inputs, withSystem, ... }:
{
  flake =
    let
      lib = import ../parts/lib/import.nix { inherit inputs; };
      inherit (lib)
        mkMerge
        concatLists
        mkSystems
        mkNixosIsos
        ;

      # modules
      modulePath = ../modules; # the base module path

      # base modules, is the base of this system configuration and are shared across all systems (so the basics)
      base = modulePath + /base;

      # profiles module, these are sensible defaults for given hardware sets
      # or meta profiles that are used to configure the system based on the requirements of the given machine
      profilesPath = modulePath + /profiles; # the base directory for the types module
      hardwareProfilesPath = profilesPath + /hardware; # the base directory for the hardware profiles
      metaProfilesPath = profilesPath + /meta; # the base directory for the meta profiles

      # hardware profiles
      laptop = hardwareProfilesPath + /laptop; # for laptop type configurations
      desktop = hardwareProfilesPath + /desktop; # for desktop type configurations
      server = [
        (hardwareProfilesPath + /server)
        headless
      ]; # for server type configurations
      wsl = [
        (hardwareProfilesPath + /wsl)
        headless
      ]; # for wsl systems

      # meta profiles
      graphical = metaProfilesPath + /graphical; # for systems that have a graphical interface
      headless = metaProfilesPath + /headless; # for headless systems

      # home-manager
      homes = ../home; # home-manager configurations

      # a list of shared modules, that means they need to be in almost all configs
      shared = [
        base
        homes
      ];

      # extra specialArgs that are on all machines
      sharedArgs = {
        inherit lib;
      };
    in
    mkMerge [
      (mkSystems [
        {
          inherit withSystem;
          host = "wattage";
          system = "x86_64-linux";
          modules = [ graphical ] ++ concatLists [ shared ];
          specialArgs = sharedArgs;
        }
      ])
    ];
}
