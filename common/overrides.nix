{ lib, config, pkgs, ... }:
{

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    packageOverrides = pkgs: rec {
      dmenu = pkgs.dmenu.override {
        patches = [ ./dmenu-patches/case-insensitive ./dmenu-patches/borders ./dmenu-patches/numbers];
      };
    };
  };

}
