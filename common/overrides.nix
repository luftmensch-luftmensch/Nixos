{ lib, config, pkgs, ... }:
{

  nixpkgs.config = {
    allowUnfree = true; # Sorry Stallman
    #allowBroken = true; # Needed for zfs (marked as broken)
  };

  #nixpkgs.config = with pkgs; {
  #  allowUnfreePredicate = (pkg: builtins.elem (lib.getName pkg) [
  #    "aseprite"
  #    "obsidian"
  #    "teams"
  #    "zoom"
  #  ]);
  #};
}
