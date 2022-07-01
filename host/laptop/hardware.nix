{ lib, config, pkgs, ... }:
{
  # Enable sound.
  sound.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
    };
    cpu = {
      amd.updateMicrocode = true; # lib.mkDefault config.hardware.enableRedistributableFirmware;
    };

    opengl= {
      enable = true;
      #driSupport = true;
      extraPackages = with pkgs; [ amdvlk ];
    };
    #pulseaudio = {
    #  enable = true;
    #};
    sane = {
      enable = true;
      extraBackends = [ pkgs.epkowa ];
    };
  };
}
