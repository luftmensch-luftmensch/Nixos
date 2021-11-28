{ lib, config, pkgs, ... }:
{

  nixpkgs.overlays = [
    ### Used only as reference ###
    #(import (builtins.fetchTarball {
    #  url = "https://github.com/InternetUnexplorer/discord-overlay/archive/main.tar.gz";
    #  sha256 = "169vamrbk3naviw20ig15206ks45sdldfriyf8imwfjl0s3myc7l";
    #}))

    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      #sha256 = "01p8wj6gb2h6q5l4kxaxjg17qkdl62062p1v542h7sbhhzxvpfl6";
      sha256 = "0y84p43vca0bylag82c04wvwibkns23p38pbwsfs73ifizywhv2j";
    }))
  ];
}
