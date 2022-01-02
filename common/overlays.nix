{ lib, config, pkgs, ... }:
let
  #emacsSHA = "1xlhbnkf7b8n94b97w3j7hqgps6ld0098m4927bnhkrafz8h9gzq";
  #neovimSHA = "1pz5dck8s0zx75q8palj6x38wqxb4d0wgwmkrq2w5r65mgjad0dr";

  emacsSHA = "0cp79la60wf29kdrb84w4d615mbc28hz8mpk4qxm121sj0bprk4w";
  neovimSHA = "06ncsyh5z4dc8vv8sb2l4ghl832l9p3n750n388668k6wl1d8n63";
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
