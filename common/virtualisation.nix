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
    libvirtd = {
      enable = true;
      onBoot = "ignore";
    };
    #  virtualbox = {
    #    host.enable = true;
    #  };
    #  spiceUSBRedirection = {
    #    enable = true;
    #  };
  };
}
