{ lib, config, pkgs, ... }:
let

  emacsSHA = "1rs3mpvg7mph4h94bcng24nlcrfgnl3v1il445n50svks15rgwn1";
  neovimSHA = "181si9b1wjwxlv0axq4gpvk5mdfylp4sz84yswggxc5q51c6m15i";

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
