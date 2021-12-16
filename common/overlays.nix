{ lib, config, pkgs, ... }:
let
  #emacsSHA = "02pv3jmlpbmfdjxwj439xvixldkidp8virlicxkjn8hgypdqc4gy"; 
  #neovimSHA = "0jrh9wqvglj1yn9pmdxscvvch1r16f79g524qirjk5qs82bvhpqq";
  emacsSHA = "05g5hglscvzy1m76qnl2cn0ab648zg83m8davnxij07g3gfiimrs"; # NEW SHA
  neovimSHA = "1x2n3nc7z6zzgxcn1vq31j1nckx8gyk2s0cggyx240h9jdml61x2"; # NEW SHA
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
