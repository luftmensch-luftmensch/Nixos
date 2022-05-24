{
  # Memo:
  # How to choose the name between default.nix shell.nix and flake.nix: It depends on how you use nix 
  # 1. If you use nix-shell, then only shell.nix called;
  # 2. If you use nix-build, then only default.nix called;
  # 3. If you use nix develop, then flake.nix called (and it may contain references to shell.nix or default.nix inside it)

  description = "A collection of crap, hacks and copy-paste to make my localhosts boot";


  # Attribute set of all the dependencies used in the flake
  inputs = {
    # Memo: It's possible to update only a single input like this:
    #           nix flake lock --update-input neovim-overlay

    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Used to get some more updated packages
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    ###              NIX COMMUNITY               ###
    #emacs-overlay.url = "github:nix-community/emacs-overlay";
    #neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  # Function of an argument that uses a the inputs for reference
  # - Configure what you imported
  # - Can be pretty much anything: Packages / configurations / modules / etc...
  # The @ symbols means `Bind the args to inputs`
  outputs = inputs @ {nixpkgs, nixos-unstable, nixos-hardware, ... }: 
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
          specialArgs = {inherit inputs;};
          inherit system;
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1 # Nixos hardware
            ./thinkpad.nix
          ];

        };

        home = lib.nixosSystem {
          specialArgs = {inherit inputs;};
          inherit system;
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
