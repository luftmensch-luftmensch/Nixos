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
      #sha256 = "0719x0dlyah5vz82vz0jivgrz4a98iml5rfqzkmf96ynh502hdh8";
      sha256 = "1r9fnd9kc8vgkr9d4w29zmc534ks5a9dqh096h667l12n7vlyjvx";
    }))
  ];
}
