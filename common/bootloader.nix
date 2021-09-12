{ lib, config, pkgs, ... }:

{
  boot = {
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot = {
        enable = true;
        configurationLimit = 10; # Maximum number of latest generations in the boot menu
        editor = false; # Fix a security hole in place for backwards compatibility (permit sudo privileges when booting)
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      #grub = {
      #  enable = true;
      #  version = 2;
      #  efiSupport = true;
      #  device = "nodev";
      #  useOSProber = true;
      #  gfxmodeEfi = "1920x1080";
      #  gfxmodeBios = "1920x1080";
      #  theme = pkgs.nixos-grub2-theme;

      #  extraEntries = ''
      #    menuentry "Reboot" {
      #      reboot
      #    }
      #    menuentry "Power off" {
      #      halt
      #    }
      #  '';
      #};
      timeout = 2;
    };

    plymouth = {
      enable = true;
    #  theme = "breeze";
    };
    #kernelPackages = pkgs.linuxPackages_latest;
    #cleanTmpDir = true;
  };
}
