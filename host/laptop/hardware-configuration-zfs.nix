# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

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

    kernelModules = [ "kvm-amd" ];
    kernelParams = [ "quiet" "udev.log_priority=3" ]; # silent boot
    kernelPackages = pkgs.linuxPackages_latest;
    zfs.enableUnstable = true; # enable it when using the latest kernel
    # Other kernelParams: 
    # "acpi_rev_override=5" "scsi_mod.use_blk_mq=1" "splash" "vga=current" "i915.fastboot=1" "pti=off" 
    # "loglevel=3" "systemd.show_status=auto" "udev.log_priority=3" "modeset" "nofb" "spectre_v2=off"
    # "acpi_rev_override=1" "pcie_port_pm=off" "rd.systemd.show_status=auto" "rd.udev.log_priority=3" 
    # "cgroup_no_v1=all" "systemd.unified_cgroup_hierarchy=yes"  "mitigations=off"

    extraModulePackages = [ ];
    supportedFilesystems = [ "zfs" ];
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
