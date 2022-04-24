{ lib, config, pkgs, ... }:
{
  
  programs.sway =  {
    enable = true;
    wrapperFeatures.gtk = true;
    #wrapperFeatures.base = true;
    extraPackages = with pkgs; [
      #swaylock # substituted with swaylock-effects
      bemenu # dmenu for wayland
      #sxiv
      imv
      wl-clipboard
      wf-recorder # Utility program for screen recording of wlroots-based compositors
      #mako # notification daemon
      #wofi

      foot # Wayland native terminal
      # GTK Theme & Font
      glib 

      # Screenshots utility
      # TODO: Check this package: sway-contrib.grimshot (grimshot --notify copy area)
      grim slurp 

      jq # Used to make a screenshot of a specific window
      
      waybar # Bar

      #xwayland An X server for interfacing X11 apps with the Wayland protocol
      #waypipe # A network proxy for Wayland clients (applications)

      # Sway relative programs
      swayidle
      swaylock-effects

    ];

    #export SUDO_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
    #export SSH_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
    #export _JAVA_AWT_WM_NONREPARENTING=1
    #export GDK_BACKEND=wayland
    #export CLUTTER_BACKEND=wayland

    # Fixing java apps (especially idea) -> _JAVA_AWT_WM_NONREPARENTING = "1";

    extraSessionCommands = ''
      export MOZ_ENABLE_WAYLAND=1
      export MOZ_DBUS_REMOTE=1
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
