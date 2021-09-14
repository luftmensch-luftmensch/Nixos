{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS ###
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      #sha256= "0000000000000000000000000000000000000000000000000000";
      sha256 = "16hj5dmw4wzgzb72f87p0cki8h1fv2fhxrxc2b7nncksjj833bv8";
      #sha256 = "17npf4g6sc2b5waxi0cwwad2wacp8m4hjbh2kq40dnhqbdxq0ymw";
    }))


  ];
}
