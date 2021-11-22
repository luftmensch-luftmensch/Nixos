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
      #sha256 = "18hm44cyqsc6lan54aaw9zf2s9b41myzlar3n8svs8w80maimcjb";
      sha256 = "09vpgbv78zia5cx8bxypnbpv5mq5qvfa6w64m8z1knyph7113qf3";
    }))
  ];
}
