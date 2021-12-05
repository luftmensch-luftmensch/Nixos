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
      #sha256 = "1izvpisn6s4q6kndch8f923b1q4nxzx71g4mc06swhh3di99zzsz";
      sha256 = "0lx0nyip1dq8pzilbyw18364ain4k9qza3dlw0lhvfvb87iz4yp5";
    }))
  ];
}
