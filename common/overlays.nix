{ lib, config, pkgs, ... }:
let
  emacsSHA = "0yq2h5wcxjnh8j1n6grb75sv8pmmm1pm991250avj4ib7kky1xdd";
  neovimSHA = "0gv2sg3zgh6bxmx7lvbcx26yvj6za8psqj5249cyi8q1cw2a1dn2";
in
{

  nixpkgs.overlays = [
    # In order to get the latest successful build cached go to https://hydra.nix-community.org/project/emacs-overlay (stable branch)
    # Get the latest succeful build for emacsPgtkGcc  -> inputs -> get revision and change it into url version

    #Emacs overlay
    (import (builtins.fetchTarball{
      url = "https://github.com/nix-community/emacs-overlay/archive/38122d98f38674d21d1ee16f34006b6fe7195949.tar.gz";
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
