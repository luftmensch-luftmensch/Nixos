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
      #sha256 = "0mj6cibsmyfi1mnvfxx6ps3kzymjdy2c8hpsqkzz66hyfbjn737q";
      sha256 = "1fkyq3bxdf2gdw7v7b217ccrbgkcczbmqwald464rx0gjqmv2y4r";
    }))
  ];
}
