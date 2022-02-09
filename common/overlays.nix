{ lib, config, pkgs, ... }:
let
  #emacsSHA = "05mhf6i0d7yiq8zixlhg0wb73xn4g07di29ik0rxgyh4q9sv5mxr";
  #neovimSHA = "0fzyg1z7j4xhvxxkqb59vgx94ryngsjk1j2jvd4fclj9bgyxy4zs";

  emacsSHA = "0bqw75xf5slvf5w6z16z4b0pdg5j7azf26jijjnzb0gvznxdkn02";
  neovimSHA = "1s6ggrrwry31vpkkiwnjn4yaih555srpccjvykshjdy0n4cp9vjy";
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
