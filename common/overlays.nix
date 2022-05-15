{ lib, config, pkgs, ... }:
let

  #neovimSHA = "0kdq5x1l8j7664rqlmdp4dsqjkpsz6bjcmhkm6hk5a8pwglsxc02";
  #neovimSHA = "1cw9f2dfd8i5s3zkri0n37dqdbraqjvxpnwdsgmsv7an9wcb8a7n";

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
    #(import (builtins.fetchTarball {
    #  url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    #  sha256 = "${neovimSHA}";
    #}))

  ];
}
