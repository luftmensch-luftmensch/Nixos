{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./hardware.nix # hardware options
    ./hardware-configuration.nix # Pretty obvious right?
    ./networking.nix # Networking option
    ./overlays.nix # Touchegg + systemd services (+ emacs, currrently disabled)
    ./services-laptop.nix # Services specific for my thinkpad configuration
    ./wayland.nix # Sway WM
    ./xorg.nix # X11 configuration
  ];
}
