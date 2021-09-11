{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./cachix.nix
    ./programs.nix
  ];
}
