{pkgs, ... }:
{

  imports = [
    # Handy way to make flake.nix less ripetitive
    ./bootloader.nix # bootloader options 
    ./overrides.nix # dmenu patches
    ./security.nix 
    ./shared.nix # Timezone, keyboard options, fonts, environment options, Flatpak
    ./virtualisation.nix # virtualisation -> now using only libvirt
  ];
}
