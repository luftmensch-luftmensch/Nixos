{ lib, config, pkgs, ... }:
{

  # Define a user account. Don't forget to set a password after the installation with `passwd --root /mnt USER`
  users.users.valentino = {
    description = "Valentino Bocchetti";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "scanner"
      "lp"
      "libvirtd"
      # "vboxusers"
    ];
    #shell = pkgs.fish;
  };

}
