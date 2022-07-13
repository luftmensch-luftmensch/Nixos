# Here I set my xorg services options
{ lib, config, pkgs, ... }:
let
  video-drivers = if (config.networking.hostName == "home") then
    "nvidia" else "amdgpu"; # nouveau in case nvidia breaks

  # Sddm theme variables
  theme-owner = "luftmensch-luftmensch";
  theme-repository = "sddm-theme";
  theme-revision = "d03373b1ddb56f295a587c9d7ffd4647bf739282";
  theme-sha = "1n9pd00dmvfq87wcr2nflbpdzviy6nvzrg3kk7d09xsssfh2d1xr";

in

{
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "${video-drivers}" ];
    displayManager = {
      sddm.enable = true;
      # To get it use `nix-prefetch-git + url of the repository`

      sddm.theme = "${(pkgs.fetchFromGitHub {
        owner = "${theme-owner}";
        repo = "${theme-repository}";
        rev = "${theme-revision}";
        sha256 = "${theme-sha}";
      })}";

      defaultSession = "none+i3";
    };

    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };

    layout = "it";
  };
}
