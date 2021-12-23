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
      #"libvirtd" # Currently not used -> To enable first comment the relevant part in the virtualisation.nix file
      "adbusers"
      #"vboxusers"
    ];
    #shell = pkgs.fish;
  };

}
