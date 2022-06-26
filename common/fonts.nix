{ lib, config, pkgs, ... }:
{
  # To get list of the font installed: (fc-list : family)
  fonts.fonts = with pkgs; [
    #dejavu_fonts
    font-awesome
    fira-code
    #liberation_ttf	
    #google-fonts # Used for karla
    #hack-font
    (nerdfonts.override { fonts = [ "Iosevka" ];  })
    #noto-fonts-emoji 
    #roboto
    source-code-pro
    #vegur
    victor-mono
    #cantarell_fonts
    #inconsolata
    mononoki
    #twemoji-color-font
    scientifica
  ];
}
