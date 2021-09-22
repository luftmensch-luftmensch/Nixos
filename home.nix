{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./host/home
    ./common
  ];
}
