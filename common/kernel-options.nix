{ config, lib, pkgs, modulesPath, ... }:
let kernel-module = if (config.networking.hostName == "home") then 
      "kvm-intel" else "kvm-amd";
in
{
  boot = {
    extraModulePackages = [ ];
    kernelModules = [ "${kernel-module}" ];
    kernelParams = [ "quiet" "udev.log_priority=3" "loglevel=3" "rd.systemd.show_status=auto" "rd.udev.log_level=3"  ]; # silent boot. Taken from -> https://wiki.archlinux.org/title/Silent_boot
    kernelPackages = pkgs.linuxPackages_latest;
    zfs.enableUnstable = true; # enable it when using the latest kernel

    # Try out:
    #kernelPackages = mkIf (elem "zfs" config.boot.supportedFilesystems) (mkDefault config.boot.zfs.package.latestCompatibleLinuxPackages);
    #zfs.enableUnstable = mkIf (elem "zfs" config.boot.supportedFilesystems) true;

    # Other kernelParams: 
    # "acpi_rev_override=5" "scsi_mod.use_blk_mq=1" "splash" "vga=current" "i915.fastboot=1" "pti=off" 
    # "systemd.show_status=auto" "modeset" "nofb" "spectre_v2=off" "boot.shell_on_fail" "mitigations=off" 
    # "systemd.unified_cgroup_hierarchy=yes" "page_alloc.shuffle=1" "page_poison=1" "slub_debug=FZP" 
    # "acpi_rev_override=1" "pcie_port_pm=off" "rd.udev.log_priority=3" "cgroup_no_v1=all"

    supportedFilesystems = [ "zfs" ];
  };
}