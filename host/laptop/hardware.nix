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

    # In substitution of nixos-hardware
    firmware = [ pkgs.rtw89-firmware ];

    opengl= {
      enable = true;
      #driSupport = true;
      #driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        #rocm-opencl-icd
        #rocm-opencl-runtime
      ];

      #extraPackages32 = with pkgs; [
      #  driversi686Linux.amdvlk
      #];
    };

    #pulseaudio = {
    #  enable = true;
    #};
    sane = {
      enable = true;
      extraBackends = [ pkgs.epkowa ];
    };

    # In substitution of nixos-hardware
    trackpoint = {
      enable = lib.mkDefault true;
      emulateWheel = lib.mkDefault config.hardware.trackpoint.enable;
    };
  };
}
