{ lib, config, pkgs, ... }:
let
  #emacsSHA = "0h0kday2y041xh2rzx796r8f63jad01743s92km9zlxxdzcym74a";
  #neovimSHA = "0j1pz3ln6v0ff4hb5h8licnv94k8gpg74rm16x5hfvxhjnia6d9f";

  emacsSHA = "18glzhn5jdxk1c5c2z5lhlj4p3lp8zsj6hpmzr2fi32g9qn10y0k"; # NEW SHA
  neovimSHA = "193xh2jmwpwxlpfikfkarnc56pzzr3aw2yd2n666v169kv3x8bby"; # NEW SHA
in
{

  nixpkgs.overlays = [
    ### Used only as reference ###
    #(import (builtins.fetchTarball {
    #  url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
    #  sha256 = "169vamrbk3naviw20ig15206ks45sdldfriyf8imwfjl0s3myc7l";
    #}))

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
