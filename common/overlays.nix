{ lib, config, pkgs, ... }:
let

  #emacsSHA = "17dz69i5sqpikzh51ccs99vdvkqibd4v55dg8hl01y708mwhcfpr";
  #neovimSHA = "1vhjdaq42vf3ppdrwbll65al29a56fvgf0cahjhk9jccbvikw9jg";

  emacsSHA = "0fzsdqq9i3yvl5ayy0gjp748awgmff4ia53bk1rmnz9l7xkbmy9n";
  neovimSHA = "1l5qa7m4xxr9kxfp9dwcc9i2qf3ncbai6nb3bsz360flgbs90ahk";

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
