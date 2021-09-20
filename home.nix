{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./options
    ./host/home
    ./common
  ];
}
