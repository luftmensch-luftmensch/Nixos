{ lib, config, pkgs, ... }:
let

  #neovimSHA = "1vi083gvrsa52x5ijjshc74hsiy2n0rp8gdnzrfnja539dpzvj9y";
  neovimSHA = "1dc6lzvxl0k9l49z517x617kxmr71niq3bi0v61zgyl26hzxz226";

  emacsSHA = "02gnvscn43hbnn2vxr36kr6ll0x66xm18ypx41bbv2rlnsp0fl40";
  emacsREV = "16262a84ef07fb0e8cfc592b65d786b086840065.tar.gz";
    

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
