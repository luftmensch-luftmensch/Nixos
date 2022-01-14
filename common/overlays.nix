{ lib, config, pkgs, ... }:
let

  emacsSHA = "079579kg4bpqv80mviip33n19gci7imdvg1fi5kkjb2qgsigqswr";
  neovimSHA = "1acdphp2c51av5gj7879m285skahyamwjh4n2bxmwzffy063byjc";

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
