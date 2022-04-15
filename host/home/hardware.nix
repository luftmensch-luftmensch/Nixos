{ lib, config, pkgs, ... }:
{
  
  # Enable sound.
  sound.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
    };
    cpu = {
      intel.updateMicrocode = true;
    };

    nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    #nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidia.modesetting.enable = true;
    #opengl = {
    #  extraPackages = with pkgs; [ vaapiVdpau libvdpau-va-gl ];
    #};
    pulseaudio ={
      enable = true;
    };
    sane = {
      enable = true;
      extraBackends = [ pkgs.epkowa ];
    };
  };
}
