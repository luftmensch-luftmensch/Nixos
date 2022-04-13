{ config, pkgs, ... }:
{
  
  services.openvpn.servers = {
    # Memo to launch/stop/restart the openvpn service (since I don't wont to exec automatically)
    #/run/current-system/sw/bin/systemctl start homelab.service
    #/run/current-system/sw/bin/systemctl stop homelab.service
    #/run/current-system/sw/bin/systemctl restart homelab.service
    #/run/current-system/sw/bin/systemctl status homelab.service
    homelab = {
      config = '' config /home/valentino/.config/vpn/thinkpad.ovpn '';
      autoStart = true;
      updateResolvConf = true;
    } 
  };
}
