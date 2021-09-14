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
      #pinentryFlavor = "curses"; # use pinetry without X
      pinentryFlavor = "gtk2"; # use pinetry without X 
      # Other options are "curses", "tty", "gtk2", "qt", "emacs", "gnome3"
    };
    sway =  {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        swaylock
        swayidle
        wl-clipboard
        mako # notification daemon
        wofi
        waybar
      ];
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
