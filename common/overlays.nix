{ lib, config, pkgs, ... }:
let
  #emacsSHA = "0cp79la60wf29kdrb84w4d615mbc28hz8mpk4qxm121sj0bprk4w";
  #neovimSHA = "06ncsyh5z4dc8vv8sb2l4ghl832l9p3n750n388668k6wl1d8n63";

  emacsSHA = "01bwv052a8r1b66d477dd1nsc03rhwfckp5mq2yvnz2nh0f4jv8c";
  neovimSHA = "15b546l8zci56dgn19fiw8pa34b10ds58rlpw0y0iqxvlp4jhq4c";
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
