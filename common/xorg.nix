# Here I set my xorg services options
{ lib, config, pkgs, ... }:
let
  video-drivers = if (config.networking.hostName == "home") then
    "nvidia" else "amdgpu"; # nouveau in case nvidia breaks
in
{
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "${video-drivers}" ];
    displayManager = {
      sddm.enable = true;
      # To get it use `nix-prefetch-git + url of the repository`
      sddm.theme = "${(pkgs.fetchFromGitHub { #theme = "personal-theme" 
        owner = "luftmensch-luftmensch";
        repo = "sddm-theme";
        rev = "d2592ac1ec9db93d3b12575c0386e53ba324529c";
        sha256 = "19g2harh1znxm08035msfnm5izdk7cr2v6n8j5p75iwg602nv42f";
      })}";

      defaultSession = "none+i3";
    };

    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
      #qtile = {
      #  enable = true;
      #};
    };

    layout = "it";
  };
}
