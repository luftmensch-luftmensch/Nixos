{ lib, config, pkgs, ... }:
{
  networking = {
    hostName = "home"; # Define your hostname.
    hostId = "b7435034"; # Define your hostname.
    networkmanager.enable = true;  # Enables Network Manager
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    useDHCP = false;
    interfaces = {
      enp3s0.useDHCP = true;
    }; 
    # Configure network proxy if necessary
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";   

  };
}
