{ lib, config, pkgs, ... }:
let
  #emacsSHA = "076fadagzhsfjlgj2qk6xr9czhpljfacw7r8g4mmxzpg91s9qngr";
  #neovimSHA = "1cwg4ix5xns4g38hw4zxgk725p0v1ypqa1ss1pkgmhrqdw93dbc1";

  emacsSHA = "05mhf6i0d7yiq8zixlhg0wb73xn4g07di29ik0rxgyh4q9sv5mxr";
  neovimSHA = "0fzyg1z7j4xhvxxkqb59vgx94ryngsjk1j2jvd4fclj9bgyxy4zs";
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
