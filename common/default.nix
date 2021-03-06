{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./bootloader.nix # bootloader options 
    ./cachix.nix # cachix options 
    ./environment.nix # Environment variables + etc configuration
    ./firewall.nix # Firewall settings
    ./fonts.nix # Fonts configuration
    ./kernel-options.nix # Kernel options + zfs options
    ./locales.nix # Timezone and locales
    ./nix.nix # Nix package manager configuration & extras
    ./overrides.nix # Absolutely proprietary options
    #./overlays.nix # Emacs 29 + Neovim unstable
    ./packages.nix # Global packages
    ./programs.nix # Global programs
    ./security.nix 
    ./services.nix # Common services shared between my hosts
    ./shared.nix # Timezone, keyboard options, fonts, environment options, Flatpak
    ./user.nix # Username + extragroup
    ./virtualisation.nix # virtualisation -> now using only libvirt
    ./xorg.nix # X11 options
  ];
}
