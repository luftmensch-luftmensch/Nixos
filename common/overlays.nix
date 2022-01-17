{ lib, config, pkgs, ... }:
let

  emacsSHA = "11ig638la19sv6sxp8vdjgyi32p8d2b81sd9qrnpppl204wqlfcb";
  neovimSHA = "0skn4lh63srhr5i696zgdwvvv915pkyang7zqg9c3kvf7m15pnpk";

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
