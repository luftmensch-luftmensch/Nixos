# Here I set my system services configuration
{ lib, config, pkgs, ... }:
# let
#   brother_printer = pkgs.linkFarm "Brother_HL-1210W_series" [{
#     name = "share/cups/model/hl3170cdw.ppd";
#     path = "${inputs.brother-hl-1210W-driver}/Brother_HL-1210W_series.ppd";
#   }];
#   in 
{
  services = {
    #chrony = {
    #  enable = true;
    #};

    #flatpak = {
    #  enable = true;
    #};

    #fprintd = {
    #  enable = true;
    #  package = (pkgs.callPackage ./fprint/fprintd.nix { });
    # prendi config da ~/config/nixos/fprint
    #};

    #gpm = {
    #  enable = true; # Virtual mouse pointer for TTY consoles
    #}


    #hardware = {
    #  bolt.enable = true; 

    #  printers = {
    #    ensureDefaultPrinter = "Brother_HL-1210W_series";
    #    ensurePrinters = [{
    #      name = "Brother_HL-1210W_series";
    #      deviceUri = "usb://Brother/HL-1210W%20series?serial=E74223F0N655618";
    #      model = "Brother-HL-1230-hl1250.ppd";
    #    }];
    #  };
    #};

    # Hard disk protection if the laptop falls:
    #hdapsd = {
    #  enable = true;
    #};

    locate = {
      enable = true;
    };

    #keynav = { # Enable mouse control with keyboard
    #  enable = true;
    #};

    openssh = {
      enable = true;
      forwardX11 = false;

      permitRootLogin = "no";
      passwordAuthentication = false;
      ports = [ 6969 ];
      #startWhenNeeded = true;
      #allowSFTP = false; # Don't set this if you need sftp
      #challengeResponseAuthentication = false;
      #extraConfig = ''
      #      AllowTcpForwarding yes
      #      X11Forwarding no
      #      AllowAgentForwarding no
      #      AllowStreamLocalForwarding no
      #      AuthenticationMethods publickey
      #    '';
    };

    #plex = {
    #  enable = true;         
    #  openFirewall = true;
    #  user = "felschr";
    #};

    #postgresql = {
    #  enable = true;
    #  package = pkgs.postgresql_13;
    #  authentication = ''
    #    local all   postgres       peer  map=eroot
    #    local all all trust   
    #    host all all localhost trust   
    #  '';
    #  identMap = ''
    #    eroot     root      postgres
    #    eroot     postgres  postgres
    #  '';
    #};

    printing = {
      enable = true;
      #drivers = [ brother_printer ]
    };

    # Smartctl daemon
    #smartd = {
    # enable = true;
    #  notifications.x11.enable = true;
    #};

    # Enable saned network daemon for remote connection to scanners
    #saned = {
    #  enable = true;
    #}

    # Available also under programs (programs.system-config-printer)
    #system-config-printer = {
    #  enable = true;
    #}

    udev = {
      extraRules = ''
        ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"       
    '';

      #Autosuspend usb
      #ACTION=="add", SUBSYSTEM=="usb", ATTR{power/control}="auto"
      #ACTION=="add", SUBSYSTEM=="usb", TEST=="power/autosuspend" ATTR{power/autosuspend}="120"

      # Set noop scheduler for zfs partitions
      #KERNEL=="sd[a-z]*[0-9]*|mmcblk[0-9]*p[0-9]*|nvme[0-9]*n[0-9]*p[0-9]*", ENV{ID_FS_TYPE}=="zfs_member", ATTR{../queue/scheduler}="none"
      #ACTION=="add|change", KERNEL=="sd[a-z]*[0-9]*|mmcblk[0-9]*p[0-9]*|nvme[0-9]*n[0-9]*p[0-9]*", ENV{ID_FS_TYPE}=="zfs_member", ATTR{../queue/scheduler}="none"
    };

    #udiskie = {
    # enable = true; 
    #};
    # udiskctl service to manipulate storage devices.
    # Mount and unmount without sudo permissions
    #udisks2 = {
    # enable = true; 
    #};

    zfs = {
      trim = {
        enable = true;
      };

      #autoSnapshot = {
      #  enable = true;
      #};

      autoScrub = {
        enable = true;
        #pools = [ "zroot" ];
        #interval = "weekly";
      };
    };

  };
}
