{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS ###
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
      #sha256= "0000000000000000000000000000000000000000000000000000";
      sha256 = "1zr84m61dd685z55qrca59sbn2qwxai1lf927615dh312b5s7a51";

    }))

  ];
}
