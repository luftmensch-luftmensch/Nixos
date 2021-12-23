{
  description = "A collection of crap, hacks and copy-paste to make my localhosts boot";
  #description = "My NixOS configuration";
  #description = "Nixos System configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #nixpkgs.url = "nixpkgs/nixos-21.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
    #discord-overlay.url = "github:InternetUnexplorer/discord-overlay"; # Leaved as reference
  };

  outputs = { nixpkgs, nixos-hardware, ... }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        PC = lib.nixosSystem {
          inherit system;
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1 # Nixos hardware
            ./thinkpad.nix
          ];

        };

        home = lib.nixosSystem {
          inherit system;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
