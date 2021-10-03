{ lib, config, pkgs, ... }:
{
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
    #victor-mono
    #cantarell_fonts
    #inconsolata
    mononoki
    #twemoji-color-font
  ];
}
