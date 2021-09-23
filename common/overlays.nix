{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS ###
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
      sha256= "0000000000000000000000000000000000000000000000000000";
    }))

  ];
}
