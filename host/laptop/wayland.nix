{ lib, config, pkgs, ... }:
{
  programs.sway =  {
    enable = true;
    wrapperFeatures.gtk = true;
    #wrapperFeatures.base = true;
    extraPackages = with pkgs; [

      bemenu # dmenu for wayland
      imv

      # Utility program for clipboard & screen recording of wlroots-based compositors
      wl-clipboard
      wf-recorder

      foot # Wayland native terminal
      glib # GTK Theme & Font

      # Screenshots utility
      sway-contrib.grimshot # (grimshot --notify copy area)
      grim slurp 

      jq # Used to make a screenshot of a specific window
      
      waybar # Bar

      # Sway relative programs
      swayidle
      swaylock-effects # a more customizable `swaylock`

      ### Other programs (currently not used) ###

      #mako # notification daemon
      #wofi # rofi for wayland
      #xwayland An X server for interfacing X11 apps with the Wayland protocol
      #waypipe # A network proxy for Wayland clients (applications)

    ];

    #export SUDO_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
    #export SSH_ASKPASS="${pkgs.ksshaskpass}/bin/ksshaskpass"
    #export _JAVA_AWT_WM_NONREPARENTING=1
    #export GDK_BACKEND=wayland
    #export CLUTTER_BACKEND=wayland

    # Fixing java apps (especially intellij) -> _JAVA_AWT_WM_NONREPARENTING = "1";

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

  #programs.hyprland = {enable = true;};
}
