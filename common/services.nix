# Here I set my system services configuration
{ lib, config, pkgs, ... }:
{
  services = {
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
      drivers = [ pkgs.hplip pkgs.brlaser pkgs.brgenml1lpr pkgs.brgenml1cupswrapper ];
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


    udev = {
      extraRules = ''
        ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"       
    '';

    #Autosuspend usb
    #ACTION=="add", SUBSYSTEM=="usb", ATTR{power/control}="auto"
    #ACTION=="add", SUBSYSTEM=="usb", TEST=="power/autosuspend" ATTR{power/autosuspend}="120"
      
    };
    #teamviewer = {
    #  enable = true;
	  #};

    #udiskie = {
    # enable = true; 
    #};
  };
  
}
