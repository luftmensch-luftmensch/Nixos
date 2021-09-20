{ lib, config, pkgs, ... }:
{
  # Enable sound.
  sound.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
    };
    cpu = {
      amd.updateMicrocode = true;
    };

    opengl= {
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
