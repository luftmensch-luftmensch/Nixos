{ lib, config, pkgs, ... }:
let
  #emacsSHA = "1kg58b4s9i3r6ir51j5kk1rszvrf69hl15y8sxf0rk07bz6mjjhv";
  #neovimSHA = "1bfhvwczpajh0w684brvz40ry2vsa9jrp8nlklpvrkg364w44829";
  emacsSHA = "09dss9ajmpmn9vznfn547n9fa14bqyz59912kmcw39lzifj5k0fl";
  neovimSHA = "04q1djy87h44yfm4866d2vvqkgzvjks31mhgc1wvr7csly6ghzh5";
in
{

  nixpkgs.overlays = [

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
