{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./dmenu.nix # Dmenu configuration
    ./hardware.nix # Hardware options
    ./filesystem-options.nix # Pretty obvious right?
    ./networking.nix # Networking option
    ./services-home.nix # Services specific for home PC configuration
    #./xorg.nix # X11 configuration
  ];
}
