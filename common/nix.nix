{ lib, config, pkgs, ... }:
{
  # nix
  nix = {
    gc = {
      automatic = true;
      dates = "Monday 09:00";
      options = "--delete-older-than 7d";
    };
    autoOptimiseStore = true;
    #readOnlyStore = false;
    trustedUsers = [ "root" "valentino" ]; # in order to use cachix
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      '';
  };
}
