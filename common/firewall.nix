{ lib, config, pkgs, ... }:
# Custom range for my projects

# Setted globally
let
  localRanges = [{from = 9000; to = 9091;}];
in {
  networking = {

    firewall = {
      allowedTCPPortRanges = localRanges;
      allowedUDPPortRanges = localRanges;
      allowedUDPPorts = [ 51820 ];

      # Whether to log rejected or dropped incoming connections.
      # Note: The logs are found in the kernel logs, i.e. `dmesg` or `journalctl -k`
      #logRefusedConnections = false;
    };
  };
}
