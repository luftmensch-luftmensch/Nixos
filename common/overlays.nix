{ lib, config, pkgs, ... }:
{

  nixpkgs.overlays = [
    ### Used only as reference ###
    #(import (builtins.fetchTarball {
    #  url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
    #  sha256 = "169vamrbk3naviw20ig15206ks45sdldfriyf8imwfjl0s3myc7l";
    #}))

    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      #sha256 = "1fbz0j33f51sap44jc4w5p6r88gsiy89h5j412k31vb91a54fys3";
      sha256 = "18hm44cyqsc6lan54aaw9zf2s9b41myzlar3n8svs8w80maimcjb";
    }))
  ];
}
