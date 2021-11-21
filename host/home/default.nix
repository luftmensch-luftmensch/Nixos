{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware.nix # Hardware options
    #./hardware-configuration-ext4.nix # Pretty obvious right?
    ./hardware-configuration-zfs.nix # Pretty obvious right?
    ./networking.nix # Networking option
    #./overlays.nix # emacs
    ./services-home.nix # Services specific for home PC configuration
    ./xorg.nix # X11 configuration
  ];
}
