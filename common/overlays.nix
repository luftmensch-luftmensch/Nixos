{ lib, config, pkgs, ... }:
let

  emacsSHA = "17dz69i5sqpikzh51ccs99vdvkqibd4v55dg8hl01y708mwhcfpr";
  neovimSHA = "1vhjdaq42vf3ppdrwbll65al29a56fvgf0cahjhk9jccbvikw9jg";

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
