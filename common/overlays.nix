{ lib, config, pkgs, ... }:
let
  #emacsSHA = "09dss9ajmpmn9vznfn547n9fa14bqyz59912kmcw39lzifj5k0fl";
  #neovimSHA = "04q1djy87h44yfm4866d2vvqkgzvjks31mhgc1wvr7csly6ghzh5";

  emacsSHA = "177v67hx1k298y6pw8gybri1fdga4r6k2zpnp4pv0cxn7g7npl6p";
  neovimSHA = "1f61zccjbh2vhqas31czamgms6f8gwxxnawrg26kk7bn9a5yzapd";
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
