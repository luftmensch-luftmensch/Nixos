{ lib, config, pkgs, ... }:
let
  #emacsSHA = "11x06z7g6gmd1ypib8hl7awj9iy3az80z2y94vpm3fsxm8vvq86j";
  #neovimSHA = "191kkxbwdyvjfs0y7jmvs29357sgm9938q2hg7486p58za2l2hxp";
  emacsSHA = "02pv3jmlpbmfdjxwj439xvixldkidp8virlicxkjn8hgypdqc4gy"; # NEW SHA
  neovimSHA = "0jrh9wqvglj1yn9pmdxscvvch1r16f79g524qirjk5qs82bvhpqq"; # NEW SHA
in
{

  nixpkgs.overlays = [
    ### Used only as reference ###
    #(import (builtins.fetchTarball {
    #  url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
    #  sha256 = "169vamrbk3naviw20ig15206ks45sdldfriyf8imwfjl0s3myc7l";
    #}))

    # Emacs Overlay
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "${emacsSHA}";
    }))

    ## Neovim overlay
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      sha256 = "${neovimSHA}";
    }))

  ];
}
