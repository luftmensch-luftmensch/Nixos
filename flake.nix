#  _        __ _                                 _        _        __ _                                 _     
# | |      / _| |                               | |      | |      / _| |                               | |    
# | |_   _| |_| |_ _ __ ___   ___ _ __  ___  ___| |__    | |_   _| |_| |_ _ __ ___   ___ _ __  ___  ___| |__  
# | | | | |  _| __| '_ ` _ \ / _ \ '_ \/ __|/ __| '_ \   | | | | |  _| __| '_ ` _ \ / _ \ '_ \/ __|/ __| '_ \ 
# | | |_| | | | |_| | | | | |  __/ | | \__ \ (__| | | |  | | |_| | | | |_| | | | | |  __/ | | \__ \ (__| | | |
# |_|\__,_|_|  \__|_| |_| |_|\___|_| |_|___/\___|_| |_|  |_|\__,_|_|  \__|_| |_| |_|\___|_| |_|___/\___|_| |_|
#                                                                                                             
# > Where the snow paradise begins
#
# Author:  luftmensch-luftmensch
# URL:     https://github.com/luftmensch-luftmensch/Nixos/
# License: GPL-3.0
{
  description = "A collection of crap, hacks and copy-paste to make my localhosts boot";


  # Attribute set of all the dependencies used in the flake
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    ###              HYPRLAND               ###
    #hyprland = {
    #  url = "github:vaxerski/Hyprland";
    #  # build with your own instance of nixpkgs
    #  #inputs.nixpkgs.follows = "nixpkgs";
    #};

    ###              NIX COMMUNITY               ###
    #emacs-overlay.url = "github:nix-community/emacs-overlay"; "github:nix-community/emacs-overlay?rev=859fbd8964ae5605e44020a559d73905f1e1cfa5"; # In order to catch cachix
    #neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  # Function of an argument that uses a the inputs for reference
  # - Configure what you imported
  # - Can be pretty much anything: Packages / configurations / modules / etc...
  outputs = {nixpkgs, ... }: 
    let
      system = "x86_64-linux"; # Current system
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        PC = lib.nixosSystem {
          #specialArgs = {inherit inputs;}; # Enable only when using two different version of nixpkgs (stable/unstable) at once
          inherit system;
          modules = [
            # Custom configuration
            ./thinkpad.nix

            ### DISABLED ###
            #nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1 # Nixos hardware
            #hyprland.nixosModules.default # hyprland WM
          ];

        };

        home = lib.nixosSystem {
          #specialArgs = {inherit inputs;}; 
          inherit system;
          modules = [
            # Custom configuration
            ./home.nix
          ];
        };
      };
    };
}
