{ lib, config, pkgs, ... }:
let
  emacsSHA = "1bwsh31n4qgzj2q47h0nb7wcpnk6ns07n3aivy5s22kfncvarydz";
  neovimSHA = "1qz6fy9j50jgqv9phsrfn3lx9vs05qrny6q1fz2i5fa04wyxv5m2";
in
{

  nixpkgs.overlays = [
    # In order to get the latest successful build cached go to https://hydra.nix-community.org/project/emacs-overlay (stable branch)
    # Get the latest succeful build for emacsPgtkGcc  -> inputs -> get revision and change it into url version

    #Emacs overlay
    (import (builtins.fetchTarball{
      url = "https://github.com/nix-community/emacs-overlay/archive/26aa8eb73f43ae039c2407ff5bc798cad67bf39d.tar.gz";
      sha256 = "${emacsSHA}";
    }))

    # Emacs Overlay
    #(import (builtins.fetchTarball {
    #  url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    #  sha256 = "${emacsSHA}";
    #}))

    ## Neovim overlay
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      sha256 = "${neovimSHA}";
    }))

  ];
}
