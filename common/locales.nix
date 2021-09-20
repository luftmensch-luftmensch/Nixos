{ lib, config, pkgs, ... }:
{
  
  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "it_IT.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "it";
  };

}
