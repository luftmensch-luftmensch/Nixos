{ lib, config, pkgs, ... }:
let
  user_ssh_key = if (config.networking.hostName == "home") then 

    # Home ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILufMERlTA2Nc1m6YyIt0dGkUgVBNEgUjJae3eTlWur2 valentino@home"

    else
    # Thinkpad ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFzBYr5q9VoIt65k0H+AkCdvjqKR6mRgEtg83bEFtvFJ valentino@PC";
in
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
      "adbusers"

      # Currently not used -> To enable first comment the relevant part in the virtualisation.nix file
      #"vboxusers"
      #"libvirtd" 
    ];

    openssh.authorizedKeys.keys = [
      # Rock Pro 64
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIXljN45Z1tPnPH0ow3i/w2hCKcc8Q2/KPTB+yl30X7R valentino@pine64"

      # P30 - Pro
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII5bHKpkOWDHNEaG5eovp8pQzsNpJIm8+ziHwF5idLKf valentino@P30-Pro"

      "${user_ssh_key}"

    ];
    #shell = pkgs.fish;
  };

}
