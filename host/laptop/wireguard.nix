{ config, pkgs, lib, ... }:
{
  networking.wg-quick.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      address = [ "10.8.0.3/32" ];
      listenPort = 51820;
      dns = [ "10.8.0.1" ];

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/home/valentino/.config/vpn/wireguard/thinkpad_privatekey";


      peers = [
        # For a client configuration, one peer entry for the server will be enough.

        # HOME
        {
          # Public key of the server (not a file path).
          publicKey = "0LED3FrHmdaSbZOQU8s9kiDfDj+RPWyK8pKVSpqBHjY=";

          # Forward all the traffic via VPN.
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          # Or forward only particular subnets
          #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

          # Set this to the server IP and port.
          endpoint = "homelab.myddns.me:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577

          # Send keepalives every 25 seconds. Important to keep NAT tables alive.
          persistentKeepalive = 25;
        }
      ];
    };
  };

  # In order to use Wireguard as "Server" node (not necessary on a peer node), we need to enable NAT
  #networking = {
  #  nat = {
  #    enable = true;
  #    externalInterface = "enp5s0";
  #    internalInterfaces = builtins.attrNames config.networking.wireguard.interfaces;
  #  };
  #};

  systemd.services = {
    wg-quick-wg0.wantedBy = lib.mkForce [ ];
  };
}
