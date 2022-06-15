{ lib, config, pkgs, ... }:
{
  
  services.dbus.enable = true;
  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      #extraPortals = with pkgs; [
      #  xdg-desktop-portal-wlr
      #  xdg-desktop-portal-gtk
      #  xdg-desktop-portal-gnome
      #];
      #gtkUsePortal = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  #system.stateVersion = "21.11"; # Did you read the comment?
  system.stateVersion = "22.05"; # Did you read the comment?
}
