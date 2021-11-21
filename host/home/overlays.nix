{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS - EMACS ###
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "1fbz0j33f51sap44jc4w5p6r88gsiy89h5j412k31vb91a54fys3";
    }))


  ];
}
