{ lib, config, pkgs, ... }:
{

  nixpkgs.config = {
    allowUnfree = true; # Sorry Stallman
    #allowBroken = true; # Needed for zfs (marked as broken)
  };
}
