{ lib, config, pkgs, ... }:
let
  #emacsSHA = "11ig638la19sv6sxp8vdjgyi32p8d2b81sd9qrnpppl204wqlfcb";
  #neovimSHA = "0skn4lh63srhr5i696zgdwvvv915pkyang7zqg9c3kvf7m15pnpk";

  emacsSHA = "1kg58b4s9i3r6ir51j5kk1rszvrf69hl15y8sxf0rk07bz6mjjhv";
  neovimSHA = "1bfhvwczpajh0w684brvz40ry2vsa9jrp8nlklpvrkg364w44829";
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
