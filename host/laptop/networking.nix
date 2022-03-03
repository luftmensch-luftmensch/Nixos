{ lib, config, pkgs, ... }:
{
  networking = {
    hostName = "PC"; # Define your hostname.
    hostId = "aad2e762"; # Define your hostId (take the value with head -c 8 /etc/machine-id)

    #hostId = builtins.substring 0 8 (builtins.hashString "md5" config.networking.hostName);
    networkmanager.enable = true;  # Enables Network Manager
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    #nameservers = lib.mkDefault [ "1.1.1.1" "1.0.0.1" ];

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

    #  interfaces = {
    #    wlp3s0 = {
    #      allowedTCPPortRanges = localRanges;
    #      allowedUDPPortRanges = localRanges;         
    #    };

    #    enp2s0f0 = {
    #      allowedTCPPortRanges = localRanges;
    #      allowedUDPPortRanges = localRanges;         
    #    };
    #  };
    #};
  };
}
