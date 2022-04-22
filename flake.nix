{
  description = "A collection of crap, hacks and copy-paste to make my localhosts boot";

  inputs = {
    # Memo: It's possible to update only a single input like this:
    #           nix flake lock --update-input neovim-overlay
    nixpkgs.url = "nixpkgs/nixos-21.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
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
