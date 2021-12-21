{ lib, config, pkgs, ... }:
let
  #emacsSHA = "1s38wq26d6jzp0hr78zfbv4n43spbp026yrawqb9xmamlpkkqijg";
  #neovimSHA = "1z60rdizp8lbc27csn3lnvhzmngja47rp60l5w5d02zzcf0dk0zm";

  emacsSHA = "13qnxjpbnmsq4y5fhwn0ijwjqac6fbpxj607ibpdb9cjipvs6bj2"; # NEW SHA
  neovimSHA = "1z8r0jhnl3miizhlhdcjvwl7jq8jwikzj5b6b6k9c47gx52sk3h1"; # NEW SHA
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
