{ lib, config, pkgs, ... }:
let
  #emacsSHA = "177v67hx1k298y6pw8gybri1fdga4r6k2zpnp4pv0cxn7g7npl6p";
  #neovimSHA = "1f61zccjbh2vhqas31czamgms6f8gwxxnawrg26kk7bn9a5yzapd";

  emacsSHA = "087lmyw3jnfiw2hqg15h351m7l4h6dxgw0iw3i3ndx9qgmanb9np";
  neovimSHA = "0wyhd23v901qyiam5vrr0cn3bapwy8jjbwjl0ixkxpnmwpw8dl25";
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
