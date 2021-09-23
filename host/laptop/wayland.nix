{ lib, config, pkgs, ... }:
{
  
  programs.sway =  {
    enable = true;
    wrapperFeatures.gtk = true;
    #wrapperFeatures.base = true;
    extraPackages = with pkgs; [
      #swaylock # substituted with swaylock-effects
      #bemenu # dmenu for wayland
      sxiv
      imv
      wl-clipboard
      #mako # notification daemon
      #wofi

      # GTK Theme & Font
      glib 

      # Screenshots utility
      grim slurp 

      jq # Used to make a screenshot of a specific window
      
      waybar # Bar

      # Sway relative programs
      swayidle
      swaylock-effects

    ];

    #export SUDO_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
    #export SSH_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
    #export _JAVA_AWT_WM_NONREPARENTING=1
    extraSessionCommands = ''
      export MOZ_ENABLE_WAYLAND=1
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_QPA_PLATFORMTHEME=qt5ct
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
    '';

  };
}
