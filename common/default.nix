{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./bootloader.nix # bootloader options 
    ./environment.nix # Environment variables + etc configuration
    ./fonts.nix # Fonts configuration
    ./locales.nix # Timezone and locales
    ./nix.nix # Nix package manager configuration & extras
    ./overrides.nix # dmenu patches
    ./packages.nix # Global packages
    ./security.nix 
    ./shared.nix # Timezone, keyboard options, fonts, environment options, Flatpak
    ./user.nix # Username + extragroup
    ./virtualisation.nix # virtualisation -> now using only libvirt
  ];
}
