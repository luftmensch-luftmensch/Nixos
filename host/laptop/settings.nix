{ config, lib, pkgs, ... }:
{
  hardware = {
    trackpoint = {
      enable = lib.mkDefault true;
      emulateWheel = lib.mkDefault config.hardware.trackpoint.enable;
    };
    firmware = [ pkgs.rtw89-firmware ];
  };

  boot = {
    kernelModules = [ "acpi_call" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];

    # Force use of the thinkpad_acpi driver for backlight control.
    # This allows the backlight save/load systemd service to work.
    kernelParams = [ "acpi_backlight=native" ];
  };

  #services.fstrim.enable = lib.mkDefault true;
}
