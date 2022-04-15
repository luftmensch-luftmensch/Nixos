{
  description = "Build a NixOS installer ISO file with nixos-stable and flake support pre-enabled.";
  
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos;
  
  outputs = { self, ... }@attrs: with attrs; {
    nixosConfigurations.nixos-flake-iso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-base.nix"
      ];
    };
    defaultPackage."x86-64_linux" = self.nixosConfigurations.isoimage.config.system.build.isoImage;
  };
}
