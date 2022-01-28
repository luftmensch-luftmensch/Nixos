{ lib, config, pkgs, ... }:
{

  nixpkgs.config = {
    allowUnfree = true; # Sorry Stallman
    allowBroken = true; # Needed for zfs (marked as broken)
    packageOverrides = pkgs: rec {
      dmenu = pkgs.dmenu.override {
        patches = [ ./dmenu-patches/case-insensitive ./dmenu-patches/borders ./dmenu-patches/numbers];
      };
    };
  };

}
