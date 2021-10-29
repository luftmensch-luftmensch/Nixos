{ lib, config, pkgs, ... }:

{
  boot = {
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot = {
        enable = true;
        configurationLimit = 10; # Maximum number of latest generations in the boot menu
        editor = false; # Fix a security hole in place for backwards compatibility (permit sudo privileges when booting)
        #consoleMode = "max";
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
      #    menuentry "Bios" {
      #      fwsetup
      #    }
      #  '';
      #};
      timeout = 2;
    };

    plymouth = {
      enable = true;
    #  theme = "breeze";
    };
    #kernel = {
    #  sysctl."vm.swappiness" = 0; # or 1
    #  sysctl."kernel/sysrq" = 1;
    #  sysctl."net.ipv4.icmp_echo_ignore_broadcasts" = 1; # Refuse ICMP echo requests on my desktop/laptop; nobody has any business  pinging them, unlike my servers.
    #  "net.ipv6.conf.all.use_tempaddr" = 2;
    #};
    #cleanTmpDir = true;
    # consoleLogLevel = 3;
  };
}
