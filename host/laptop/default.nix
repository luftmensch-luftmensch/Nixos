{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./config.nix # Networking, hardware options, nix options, user options
    ./hardware-configuration.nix # Pretty obvious right?
    ./overlays.nix # Touchegg + systemd services (+ emacs, currrently disabled)
    ./services.nix # Xserver + Other services
  ];
}
