# Services specific for my home machine
{ lib, config, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      user = "valentino";
      configDir = "/home/valentino/.config/syncthing";
      openDefaultPorts = true; # TCP 22000 for transfer, UDP 21027 for discovery 

      overrideFolders = true; # Purge folders not declaratively configured!
      overrideDevices = true;
      #relay.enable = true;

      devices = {
        P30-PRO = {
          id = "POGJUQZ-LA6JNGT-T7VN6AL-ZYVOEGE-HHNDWPN-6SXXULO-IQKO7KQ-6HNPBQP"; # P30-PRO
        };
        PC = {
          id = "OG5I5LS-4IX3TVN-3QJDBGP-ZYSBAJ7-CWXYE2E-JE7VGLL-46V3D2R-JNLIDAP"; # PC
        };
        
      };
      folders = {
        "Music" = {
         path = "/home/valentino/Music";
         id = "n4gcw-3q7u5";
         devices = [ "PC" ]; # pc
        };

        "Dropbox" = {
         path = "/home/valentino/Dropbox";
         id = "tcfun-ya2ir";
         devices = [ "P30-PRO" "PC" ]; # NAS
        };

        "Video" = {
         path = "/home/valentino/Video";
         id = "tzf49-nwpwz";
         devices = [ "PC" ]; # PC
        };
        
      };

    };
    
  };
}
