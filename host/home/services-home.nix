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
          id = "AG2NAHJ-EIAUJAT-MMSKSK5-4XCV7Q3-X336QGV-NIWEJLZ-2IDMTDL-K3ZFCQ4"; # PC
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
