{ lib, config, pkgs, ... }:

{
  programs = {
    adb = {
      enable = true; # Needed for Android Studio
    };
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
