{ lib, config, pkgs, ... }:
let

  #neovimSHA = "0am1bifxg8088gzw9g2qmbqmql100lhai5lkaxjkigbarfkb0rk8";
  #emacsSHA = "01pyv8g89cfy9c7iw5krb209j1cn8j79cqqmpc2zgp235aph4wjj";
  #emacsREV = "3204060454868491463e951a7c29947bbe09bc2f.tar.gz";

  neovimSHA = "04k1ywiz1dk6f311kkihpd8y2v55bqa1snlpgxpghcf7cfpx8m14";
  emacsSHA = "1dw6ysxmcmkc1in19cxdw3nkamwarzqm4gd3lan5dmwh7ianmp6r";
  emacsREV = "41b030aed1fe36edb73cf80e3215acdaef394fe3.tar.gz";
in
{

  nixpkgs.overlays = [
    # In order to get the latest successful build cached go to https://hydra.nix-community.org/project/emacs-overlay (stable branch)
    # Get the latest succeful build for emacsPgtkGcc  -> inputs -> get revision and change it into url version

    #Emacs overlay
    (import (builtins.fetchTarball{
      url = "https://github.com/nix-community/emacs-overlay/archive/${emacsREV}";
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
