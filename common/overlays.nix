{ lib, config, pkgs, ... }:
let

  neovimSHA = "08ajwpjhwwkcar5fdzhcj0zz1lva0xj3zxjqfjk1a650lyplrl61";

  emacsSHA = "1dw6ysxmcmkc1in19cxdw3nkamwarzqm4gd3lan5dmwh7ianmp6r";
  emacsREV = "41b030aed1fe36edb73cf80e3215acdaef394fe3.tar.gz";

in
{

  nixpkgs.overlays = [
    # In order to get the latest successful build cached (avoiding to build from source) go to https://hydra.nix-community.org/project/emacs-overlay (stable branch)
    # Get the latest succeful build for emacsPgtkGcc  -> inputs -> get revision and change it into url version

    #Emacs overlay
    (import (builtins.fetchTarball{
      url = "https://github.com/nix-community/emacs-overlay/archive/${emacsREV}";
      sha256 = "${emacsSHA}";
    }))

    ## Neovim overlay
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      sha256 = "${neovimSHA}";
    }))

  ];
}
