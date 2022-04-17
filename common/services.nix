# Here I set my system services configuration
{ lib, config, pkgs, ... }:
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
      #drivers = [ pkgs.hplip pkgs.brlaser pkgs.brgenml1lpr pkgs.brgenml1cupswrapper ];
      #drivers = [ pkgs.brlaser ];
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
    #smartd = {
    # enable = true;
    #  notifications.x11.enable = true;
    #};

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
