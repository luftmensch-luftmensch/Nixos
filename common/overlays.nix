{ lib, config, pkgs, ... }:
let
  #emacsSHA = "0m5n1ylsx5pjn6xzp13kmkykds6kd7plm9svj78izsnz2240yas2";
  #neovimSHA = "08v627zlqna0ccg8064qs76qg3914w1srw5jjxx1lqkn6mgdzskg";

  emacsSHA = "076fadagzhsfjlgj2qk6xr9czhpljfacw7r8g4mmxzpg91s9qngr";
  neovimSHA = "1cwg4ix5xns4g38hw4zxgk725p0v1ypqa1ss1pkgmhrqdw93dbc1";
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
