{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware.nix # hardware options
    ./filesystem-options.nix # Pretty obvious right?
    ./gestures.nix # Touchegg + systemd services
    ./networking.nix # Networking option
    ./openvpn.nix # VPN
    ./services-laptop.nix # Services specific for my thinkpad configuration
    ./wayland.nix # Sway WM
    ./xorg.nix # X11 configuration
  ];
}
