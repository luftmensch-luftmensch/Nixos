{ config, lib, pkgs, modulesPath, ... }:
let
  kernel-module = if (config.networking.hostName == "home") then 
    "kvm-intel" else "kvm-amd";
  #kernel-package = if (config.networking.hostName == "home") then 
  #    "linuxPackages" else "linuxPackages_latest";

  additional_kernel_modules = lib.optionals (config.networking.hostName == "PC") [
    "acpi_call"
    "amdgpu"
  ];

  # Force use of the thinkpad_acpi driver for backlight control.
  # This allows the backlight save/load systemd service to work.
  additional_kernel_params = lib.optionals (config.networking.hostName == "PC") [
    "acpi_backlight=native"
    #"radeon.si_support=0" "amdgpu.si_support=1" 
    #"radeon.cik_support=0" "amdgpu.cik_support=1" 
  ];
in
{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; lib.optionals (config.networking.hostName == "PC") [ acpi_call ];
    kernelModules = [ "${kernel-module}"] ++ additional_kernel_modules ;
    kernelParams = [ "quiet" "udev.log_priority=3" "loglevel=3" "rd.systemd.show_status=auto" "rd.udev.log_level=3"    ] ++ additional_kernel_params; # silent boot. Taken from -> https://wiki.archlinux.org/title/Silent_boot
    #kernelPackages = pkgs."${kernel-package}"; #pkgs.linuxPackages; # pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages; # pkgs.linuxPackages_latest;
    zfs.enableUnstable = true; # enable it when using the latest kernel

    # Try out:
    #kernelPackages = mkIf (elem "zfs" config.boot.supportedFilesystems) (mkDefault config.boot.zfs.package.latestCompatibleLinuxPackages);
    #zfs.enableUnstable = mkIf (elem "zfs" config.boot.supportedFilesystems) true;

    # Other kernelParams: 
    # "acpi_rev_override=5" "scsi_mod.use_blk_mq=1" "splash" "vga=current" "i915.fastboot=1" "pti=off" 
    # "systemd.show_status=auto" "modeset" "nofb" "spectre_v2=off" "boot.shell_on_fail" "mitigations=off" 
    # "systemd.unified_cgroup_hierarchy=yes" "page_alloc.shuffle=1" "page_poison=1" "slub_debug=FZP" 
    # "acpi_rev_override=1" "pcie_port_pm=off" "rd.udev.log_priority=3" "cgroup_no_v1=all"

    # F#&$*ng Spectre
    # "nospec_store_bypass_disable" "no_stf_barrier" "mds=off" "mitigations=off"
    # "noibrs" "noibpb" "nopti" "nospectre_v1" "nospectre_v2" "l1tf=off"

    # Kernel params with zfs
    # "zfs.zfs_arc_max=17179860388" # 16GB, was 8383029248 (8GB) # Tune ZFS ARC size

    supportedFilesystems = [ "zfs" ];
  };
}
