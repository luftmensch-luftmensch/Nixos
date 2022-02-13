{ config, lib, pkgs, modulesPath, ... }:
let kernel-module = if (config.networking.hostName == "home") then 
      "kvm-intel" else "kvm-amd";
in
{
  boot = {
    extraModulePackages = [ ];
    kernelModules = [ "${kernel-module}" ];
    kernelParams = [ "quiet" "udev.log_priority=3" ]; # silent boot
    kernelPackages = pkgs.linuxPackages_latest;
    zfs.enableUnstable = true; # enable it when using the latest kernel

    # Try out:
    #kernelPackages = mkIf (elem "zfs" config.boot.supportedFilesystems) (mkDefault config.boot.zfs.package.latestCompatibleLinuxPackages);
    #zfs.enableUnstable = mkIf (elem "zfs" config.boot.supportedFilesystems) true;

    # Other kernelParams: 
    # "acpi_rev_override=5" "scsi_mod.use_blk_mq=1" "splash" "vga=current" "i915.fastboot=1" "pti=off" 
    # "loglevel=3" "systemd.show_status=auto" "udev.log_priority=3" "modeset" "nofb" "spectre_v2=off"
    # "acpi_rev_override=1" "pcie_port_pm=off" "rd.systemd.show_status=auto" "rd.udev.log_priority=3" 
    # "cgroup_no_v1=all" "systemd.unified_cgroup_hierarchy=yes"  "mitigations=off"

    supportedFilesystems = [ "zfs" ];
  };
}
