{ lib, config, pkgs, ... }:
let
  #emacsSHA = "087lmyw3jnfiw2hqg15h351m7l4h6dxgw0iw3i3ndx9qgmanb9np";
  #neovimSHA = "0wyhd23v901qyiam5vrr0cn3bapwy8jjbwjl0ixkxpnmwpw8dl25";

  emacsSHA = "0zq0saq9965x0b8861bw8m4dx39qs5v2772y0hdxi6x8p8mn0k26";
  neovimSHA = "09vkkxnvr6z0v23rlzlwwz9f8m21fpmqdgsl33ys3gyslj92micw";
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
