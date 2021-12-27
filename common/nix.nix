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
    trustedUsers = [ "root" "valentino" ]; # in order to use cachix. Other options: "@wheel"
    package = pkgs.nixFlakes; # pkgs.nixUnstable

    # keep-outputs and keep-derivations options are great for development shells
    # also empty the registry: it will allow you to not redownload 100MBs every time
    # you collect garbage, but those 100MBs will be stored on the disk
    # https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-registry.html

    # Other options:
    # keep-outputs = true
    # keep-derivations = true
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
