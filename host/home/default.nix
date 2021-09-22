{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware-configuration.nix # Pretty obvious right?
    ./hardware.nix # Hardware options
    ./networking.nix # Networking option
    #./overlays.nix # emacs
    ./services-home.nix # Services specific for home PC configuration
    ./xorg.nix # X11 configuration
  ];
}
