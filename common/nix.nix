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

    # Other options (currently not used)
    #daemonNiceLevel = 2; # 19 max
    #daemonIONiceLevel = 2; # 7 max

    ## free up to 20GiB whenever there is less than 5GB left: 
    #extraOptions = ''
    #  connect-timeout = 5 
    #  min-free = ${toString (5 * 1024 * 1024 * 1024)}
    #  max-free = ${toString (20 * 1024 * 1024 * 1024)}
    #'';
  };
}
