{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware-configuration.nix # Pretty obvious right?
    ./hardware.nix # Hardware options
    ./networking.nix # Networking option
    #./overlays.nix # emacs
    ./services.nix # Other services
    ./xorg.nix # X11 configuration
  ];
}
