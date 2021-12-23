{ lib, config, pkgs, ... }:
{
  
  virtualisation = {
    ##  docker = {
    ##   enable = true;
    ##   extraOptions = "--ip 127.0.0.1";
    ##   storageDriver = "devicemapper";
    ##   socketActivation = true;
    ##   enableOnBoot = false;
    ##   liveRestore = false;
    ##   autoPrune = {
    ##      enable = true;
    ##      dates = "10:00";
    ##     };
    ##  };

    # podman = {
    #   enable = true;
    # };
    # containers = {
    #     registries.search = [ "docker.io" ];
    # };
    #libvirtd = {
    #  enable = true;
    #  onBoot = "ignore";
    #  onShutdown = "shutdown";
    #  #qemu = {
    #  #  package = pkgs.qemu_kvm;
    #  #  ovmf.enable = true;
    #  #}
    #};
    #virtualbox = {
    #  host.enable = true;
    #  enableExtensionPack = true;
    #  enableHardening = true;
    #};

    #Install the SPICE USB redirection helper with setuid privileges.
    #This allows unprivileged users to pass USB devices connected to this machine to libvirt VMs, both local and remote.
    #Note that this allows users arbitrary access to USB devices.
    #spiceUSBRedirection = {
    #  enable = true;
    #};
  };
}
