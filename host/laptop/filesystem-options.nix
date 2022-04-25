# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.

{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  # Unlock a full disk encryption NixOS with usb memory stick https://dataswamp.org/~solene/2020-10-06-nixos-luks-key.html
  boot = {
    initrd = {
      luks.devices."nix-enc" = {
        device = "/dev/disk/by-uuid/a30be4f9-c2cf-43d1-99f6-5d37a61bdbef"; #/dev/nvme0n1p3 (blkid)
        preLVM = true;
        allowDiscards = true;  
        keyFileSize = 4096;
        keyFile = "/dev/disk/by-id/usb-Innostor_Innostor_ALF3DAEARV00000001519-0:0";
        fallbackToPassword = true;
      };

      availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];

      #kernelModules = [ "dm-snapshot" ];
    };
  };

  fileSystems."/" =
    { device = "zroot/root/nixos";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "zroot/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/SWAP"; }
    ];

}
