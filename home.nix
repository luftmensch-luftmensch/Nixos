{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./options/default.nix
    ./host/home/default.nix
    ./common/default.nix
  ];
}
