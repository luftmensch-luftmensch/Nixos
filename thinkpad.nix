{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    #./options/default.nix
    ./host/laptop
    ./common
  ];
}
