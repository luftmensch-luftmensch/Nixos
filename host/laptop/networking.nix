{ lib, config, pkgs, ... }:
{
  networking = {
    hostName = "PC"; # Define your hostname.
    networkmanager.enable = true;  # Enables Network Manager
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    useDHCP = false;
    interfaces = {
      enp2s0f0.useDHCP = true;
      wlp3s0.useDHCP = true;
    }; 

    # Configure network proxy if necessary
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";   

    # Configure firewall if necessary
    #firewall = {
    #  allowedTCPPorts = [ ... ];
    #  allowedUDPPorts = [ ... ];
    #  enable = false;
    #};
  };

}
