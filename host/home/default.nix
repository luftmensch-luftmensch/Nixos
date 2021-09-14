{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./config.nix # Networking, hardware options, nix options, user options
    ./hardware-configuration.nix # Pretty obvious right?
    ./packages.nix # Global packages
    ./overlays.nix # emacs
    ./services.nix # Xserver + Other services
  ];
}
