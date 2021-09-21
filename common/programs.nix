{ lib, config, pkgs, ... }:

{
  programs = {
    bash = {
      enableCompletion = true;
    };
    #mtr = { # Network diagnostics tool
    #  enable = true;
    #};
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      #grabKeyboardAndMouse = true;
      pinentryFlavor = "gnome3"; # Set this in order to use it on wayland
      # Other options are "curses", "tty", "gtk2", "qt", "emacs", "gnome3"
    };

    sway =  {
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
      extraSessionCommands = ''
      export MOZ_ENABLE_WAYLAND=1
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
    '';

    };

    #zsh = {
    #  enable = true;
    #  enableCompletion = true;     
    #};
    #fish = {
    #  enable = true;
    #};
    #starship = {
    #  enable = true;
    #  enableBashIntegration = true;
    #  enableZshIntegration = true;   
    #};

    #qutebrowser = {
    #  settings.qt.args = [ "enable-native-gpu-memory-buffers" "enable-gpu-rasterization" "use-gl=egl" "ignore-gpu-blacklist" "num-raster-threads=4" ];
   #};
  };
}
