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
      #sha256 = "1san7m6c1ys6m6gf6md6lr7gviwcfxva432fndi3sbl417rrmad4";
      sha256 = "04xrm8cv9qr8a86mdwfqfp8nycm8p89ivrinpq0bzpsj5z3afi5c";
    }))
  ];
}
