{ lib, config, pkgs, ... }:
let

  emacsSHA = "0ihw3nwrbvm0qmbkclfh8sd9z06gf536ay681mrflh60g68bzx2m"; # NEW SHA
  neovimSHA = "0rnfn5q7bsp0r8s3hq50kwvz2gj7qq5vd8ldvwm2nrbbbas7idy2"; # NEW SHA
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
