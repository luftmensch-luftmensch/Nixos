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

 
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;



  fonts.fonts = with pkgs; [
    #dejavu_fonts
    font-awesome
    fira-code
    #liberation_ttf	
    #google-fonts
    #hack-font
    (nerdfonts.override { fonts = [ "Iosevka" ];  })
    #noto-fonts-emoji 
    source-code-pro
    #vegur
    #cantarell_fonts
    #inconsolata
    #mononoki
    #twemoji-color-font
  ];
  environment = {
    variables = {
      QT_QTA_PLATFORMTHEME = "qt5ct";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      EDITOR = "vim";
      BROWSER= "firefox";
      PAGER="less --quit-at-eof";
      #MANPAGER="$PAGER";
    };
    etc = {

      "xdg/user-dirs.defaults".text = ''
      XDG_DOWNLOAD_DIR="$HOME/Scaricati"
      XDG_DOCUMENTS_DIR="$HOME/Documenti"
      XDG_PICTURES_DIR="$HOME/Immagini"
      XDG_VIDEOS_DIR="$HOME/Video"
      '';

      "xdg/gtk-2.0/gtkrc".text = ''
      gtk-theme-name="Materia-dark"
      gtk-icon-theme-name="breeze-dark"
      gtk-font-name="Sans 10"
      gtk-cursor-theme-name="capitaine-cursors"
      gtk-cursor-theme-size=0
      gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
      gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
      gtk-button-images=0
      gtk-menu-images=0
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
      '';

      "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-theme-name=Materia-dark
      gtk-icon-theme-name=breeze-dark
      gtk-font-name=Sans 10
      gtk-cursor-theme-size=0
      gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
      gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
      gtk-button-images=0
      gtk-menu-images=0
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=1
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle=hintslight
      gtk-xft-rgba=rgb
      gtk-cursor-theme-name=capitaine-cursors
      '';

    };
  };

  xdg.portal.enable = true; # Flatpak
}
