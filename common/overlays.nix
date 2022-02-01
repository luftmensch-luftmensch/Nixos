{ lib, config, pkgs, ... }:
let
  #emacsSHA = "0zq0saq9965x0b8861bw8m4dx39qs5v2772y0hdxi6x8p8mn0k26";

  emacsSHA = "14c62bqbzf7mj6ag550nr7v9292n4jv2m5qywgf7ak1w22bkjz64";
  neovimSHA = "09vkkxnvr6z0v23rlzlwwz9f8m21fpmqdgsl33ys3gyslj92micw";
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
