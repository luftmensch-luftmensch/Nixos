{ lib, config, pkgs, ... }:
{
  
  networking = {
    hostName = "home"; # Define your hostname.
    networkmanager.enable = true;  # Enables Network Manager
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    useDHCP = false;
    interfaces = {
      enp3s0.useDHCP = true;
    }; 
    # Configure network proxy if necessary
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";   

    # Configure firewall if necessary
    #firewall = {
    #  allowedTCPPorts = [ ... ];
    #  allowedUDPPorts = [ ... ];
    #  enable = false;
    #};
  };


  # Enable sound.
  sound.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
    };
    cpu = {
      intel.updateMicrocode = true;
    };
    pulseaudio ={
      enable = true;
    };
    sane = {
      enable = true;
      extraBackends = [ pkgs.epkowa ];
    };
  };
  hardware.opengl.extraPackages = with pkgs; [ vaapiVdpau libvdpau-va-gl ];

  # nix
  nix = {
    gc = {
      automatic = true;
      dates = "Monday 09:00";
      options = "--delete-older-than 7d";
    };
    autoOptimiseStore = true;
    #readOnlyStore = false;
    trustedUsers = [ "root" "valentino" ]; # in order to use cachix
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      '';
  };


  # Define a user account. Don't forget to set a password after the installation with `passwd --root /mnt USER`
  users.users.valentino = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "scanner"
      "lp"
      "libvirtd"
      # "vboxusers"
    ];
    hashedPassword = "$6$RP7gMenIx8ci$k8Hj9dOPWkvDxBmv2FIaKR1KwY6sQduoM5ryU2f30UsvWg.eg5dyFNkSvQXNsNEDCoe4.maNM2wdp9KOKkR98/"; # mkpasswd -m sha-512

    #shell = pkgs.fish;
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?


}
