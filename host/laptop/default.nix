{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware.nix # hardware options
    ./filesystem-options.nix # Pretty obvious right?
    ./gestures.nix # Touchegg + systemd services
    ./networking.nix # Networking option
    ./openvpn.nix # VPN with OpenVPN
    ./services-laptop.nix # Services specific for my thinkpad configuration
    ./wayland.nix # Sway WM
    ./wireguard.nix # VPN with Wireguard
    ./xorg.nix # X11 configuration
  ];
}
