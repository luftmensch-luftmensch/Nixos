{ lib, config, pkgs, ... }:
# Custom range for my Uni projects

# TODO: Set per interfaces (Now setted globally)
let
  localRanges = [{from = 9000; to = 9091;}];
in {
  networking = {

    firewall = {
      allowedTCPPortRanges = localRanges;
      allowedUDPPortRanges = localRanges;
      allowedUDPPorts = [ 51820 ];
    };
  };
}
