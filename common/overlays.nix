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
      #sha256 = "0lx0nyip1dq8pzilbyw18364ain4k9qza3dlw0lhvfvb87iz4yp5";
      sha256 = "0awqhf4ry6f547zaay1im9dzvwi5b1zdp7grmq3kn6fivbp01m66";
    }))
  ];
}
