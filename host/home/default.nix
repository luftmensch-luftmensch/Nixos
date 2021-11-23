{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware.nix # Hardware options
    #./hardware-configuration-ext4.nix # Moved to zfs (Used only as reference now)
    ./hardware-configuration-zfs.nix # Pretty obvious right?
    ./networking.nix # Networking option
    ./services-home.nix # Services specific for home PC configuration
    ./xorg.nix # X11 configuration
  ];
}
