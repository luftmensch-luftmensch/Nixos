{
  description = "Build a NixOS installer ISO file with nixos-stable and flake support pre-enabled.";
  
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-21.11;
  
  outputs = { self, ... }@attrs: with attrs; {
    nixosConfigurations.nixos-flake-iso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-base.nix"
      ];
    };

    # In order to build it -> nix build .#nixosConfigurations.isoimage.config.system.build.isoImage (without the following line)
    defaultPackage."x86-64_linux" = self.nixosConfigurations.isoimage.config.system.build.isoImage;

    # Since we defined it we can just use nix build
  };
}
