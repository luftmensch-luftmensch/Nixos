{ lib, config, pkgs, ... }:
let

  neovimSHA = "0ypv1nvm7y4z272b5cc48s1wp5639wnrw5d76vdpakj7jn13r20f";

  #emacsSHA = "16i90wn14p89vx9zbfsm3yqy93n434fn02n5s1anr6gav4pnp56n";
  #emacsREV = "6216f7c7e05c5f7d579dc898219207a8509be910.tar.gz";
    

in
{

  nixpkgs.overlays = [
    # In order to get the latest successful build cached (avoiding to build from source) go to https://hydra.nix-community.org/project/emacs-overlay (stable branch)
    # Get the latest succeful build for emacsPgtkGcc  -> inputs -> get revision and change it into url version

    #Emacs overlay
    #(import (builtins.fetchTarball{
    #  url = "https://github.com/nix-community/emacs-overlay/archive/${emacsREV}";
    #  sha256 = "${emacsSHA}";
    #}))

    ## Neovim overlay
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      sha256 = "${neovimSHA}";
    }))

  ];
}
