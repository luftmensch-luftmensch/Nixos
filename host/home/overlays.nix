{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS ###
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256= "0000000000000000000000000000000000000000000000000000";
      #sha256 = "17npf4g6sc2b5waxi0cwwad2wacp8m4hjbh2kq40dnhqbdxq0ymw";
    }))


  ];
}
