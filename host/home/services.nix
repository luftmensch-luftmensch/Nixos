# Here I set my system services configuration
{ lib, config, pkgs, ... }:
{
  
  services = {
    #autorandr = {
    #  enable = true; 
    #};
    #chrony = {
    #  enable = true;
    #};
    flatpak = {
	    enable = true;
    };
    #fprintd = {
    #  enable = true;
    #  package = (pkgs.callPackage ./fprint/fprintd.nix { });
    # prendi config da ~/config/nixos/fprint
    #};
    #greenclip = {
	  #  enable = true;
    #};
    #hardware = {
    #  bolt.enable = true; 
    #};
    locate = {
      enable = true;
    };
    #keynav = { # Enable mouse control with keyboard
    #  enable = true;
    #};
    openssh = {
      enable = true;
      forwardX11 = true;
    };
    #pipewire = {
      #enable = true;
      #alsa.enable = true;
      #alsa.support32Bit = true;
      #jack.enable = true;
      #pulse.enable = true;
      #lowLatency.enable = true;
    #};
    #plex = {
    #  enable = true;         
    #  openFirewall = true;
    #  user = "felschr";
    #};
    #postgresql = {
    #  enable = true;
    #  package = pkgs.postgresql_12;
    #  authentication = ''
    #    local all   postgres       peer  map=eroot
    #  '';
    #  identMap = ''
    #    eroot     root      postgres
    #    eroot     postgres  postgres
    #  '';
    #};
    printing = {
      enable = true;
    };

    #redshift = {
    #  enable = true;
    #  brightness = {
    #    day = "1";
    #    night = "0.90";
    #  };
    #  temperature = {
    #    day = 6500;
    #    night = 3500;
    #  };
    #};

    # Smartctl daemon
    #services.smartd = {
    #  enable = true;

    #  notifications.x11.enable = true;
    #};
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
        "home/valentino/Music" = {
         id = "n4gcw-3q7u5";
         devices = [ "PC" ]; # pc
        };

        "home/valentino/Dropbox" = {
         id = "tcfun-ya2ir";
         devices = [ "P30-PRO" "PC" ]; # NAS
        };

        "home/valentino/Video" = {
         id = "tzf49-nwpwz";
         devices = [ "PC" ]; # PC
        };
        
      };

    };

    udev = {
      extraRules = ''
        ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"       
    '';
      
    };
    #teamviewer = {
    #  enable = true;
	  #};

    #tlp = {
    #  enable = true;
    #  settings = {
    #    CPU_SCALING_GOVERNOR_ON_BAT="powersave";
    #    CPU_SCALING_GOVERNOR_ON_AC="performance";

    #    CPU_MAX_PERF_ON_AC=75;
    #    CPU_MAX_PERF_ON_BAT=60;
    #  };
    #};
    #udiskie = {
    # enable = true; 
    #};
  };


}
