{ lib, ... }:
{
  perSystem =
    { inputs', pkgs, ... }:
    {
      packages.bun = import ./bun.nix { inherit pkgs lib; };
    };
}
