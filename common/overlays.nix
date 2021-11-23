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
      #sha256 = "09vpgbv78zia5cx8bxypnbpv5mq5qvfa6w64m8z1knyph7113qf3";
      sha256 = "0719x0dlyah5vz82vz0jivgrz4a98iml5rfqzkmf96ynh502hdh8";
    }))
  ];
}
