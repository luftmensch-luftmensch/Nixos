{ pkgs, lib, config, ... }:
let
  user_pkgs = with pkgs; if (config.networking.hostName == "home") then[
    dmidecode # Tool per ricavare le informazioni sull'hardware del computer contenute nel BIOS
    emacs
    gimp-with-plugins
    imv
    libreoffice
    linuxPackages.cpupower
    plymouth # enable also the boot option

    edk2
    libvirt
    OVMF
    

  ] else [
    acpi # information about battery
    autorandr # manage multiple screen
    brightnessctl # manage brightness
    emacsPgtkGcc # emacs 28 with Pgtk + Gcc
    pulseaudio
    touchegg # Waiting for the latest release -> now using an overlay
  ];
in
{

  environment.systemPackages = with pkgs; [
    # Cli programs 

    ### A ###
    alacritty
    #android-file-transfer
    #anydesk
    #ark
    autotiling
    #appimage-run

    ### B ###
    bat
    #bc
    betterdiscordctl
    #betterlockscreen
    bitwarden #bitwarden-cli
    bluez
    breeze-gtk
    breeze-qt5
    #bmon # Network Bandwidth Monitoring and Debugging Tool

    ### C ###
    capitaine-cursors
    # carla
    #colorpicker

    ### D ###
    #dbeaver # A better alternative to PGAdmin
    discord
    devour # Enable terminal swallowing (used for zathura)
    #dropbox
    #dropbox-cli
    dunst
    
    ### E ###
    #emacsPgtkGcc # enable first the overlay!
    exa
    exiftool # Used for emms

    ### F ###
    feh
    firefox
    filezilla
    #firebird
    ffmpeg
    fish
    #foliate # Minimal E-Book reader
    fortune
    #freetube # FOSS private YT app

    ### G ###
    git
    # gitAndTools.gitFull

    gnome.adwaita-icon-theme
    gnome.gtk
    gnome3.gnome-disk-utility
    #guvcview #(camera preview)
    #gotop

    ### H ###
    #haskellPackages.greenclip
    htop

    ### J ###
    #jetbrains.idea-community

    ### K ###
    #kdenlive
    killall
    kitty

    ### I ###
    imagemagick # Useful utility
    isync # Used for mu4e
    #inetutils # (Network utilities)

    ### L ###
    libnotify # Used to solve dunst problems
    lm_sensors
    lsd
    lshw
    lsof
    lxappearance

    ### M ###
    materia-theme
    #mkpasswd # Generates passwords and can apply them automatically to users
    mpg123 # Used for dunst sound notifications
    mpv
    mu

    ### N ###
    #neovim
    #netbeans
    networkmanagerapplet
    #nodejs-16_x
    #nodePackages."@vue/cli"
    #nodePackages.npm
    #nvtop

    #ncdu # like du but interactive

    ### O ###
    obs-studio
    #onedrive
    #openvpn # VPN
    openssl

    ### P ###
    pamixer # Used in i3
    pandoc
    papirus-icon-theme
    parcellite # Substitute of clipman
    pavucontrol
    pcmanfm
    picom
    polybarFull
    poppler 
    #postgresql_12
    #postman
    #progress
    #pulseaudio

    ### Q ###
    qt5ct
    #qrcp
    qutebrowser

    ### R ###
    ranger
    ripgrep
    rofi

    ### S ###
    scrot
    speedtest-cli
    spotify
    sshpass
    #steam steam-run-native # Gaming

    #stow  # (TODO try it!)
    #skippy-id # (exposè function)
    #superTuxKart

    ### T ###
    #teamviewer
    #teams
    tdesktop
    telnet
    #termite # substituted with kitty
    thunderbird

    texlive.combined.scheme-full

    ### U ###
    #udiskie #(udisks2 frontend)
    ueberzug
    #unrar
    unzip
    #usbguard # Protect against infected USB
    usbutils

    ### V ###
    #vault # (bitwarden alternative)
    vimHugeX # vim with X clipboard
    #viewnior
    #virt-viewer 
    #openvpn wireguard # VPN Stuff
    #vscode

    ### W ###
    wget

    ### X ###
    xautolock
    xclip
    xdg-user-dirs
    xdotool
    #xfce.xfce4-clipman-plugin # Substituted with parcellite
    xfce.xfce4-screenshooter
    xfce.thunar # Need xfce.tumbler
    xfce.thunar-archive-plugin
    #xfce.thunar-volman # automatic management of removable drives and media
    xfce.tumbler
    xorg.xev
    xorg.xkill
    xorg.xrdb
    xss-lock


    ### Y ###
    youtube-dl

    ### Z ###
    zathura  
    zip

    # Programming
    ccls clang_11 cmake gcc10 #gdb
    gnumake valgrind
    jdk
    libtool
    python3
    #python39Packages.i3ipc
    python39Packages.mutagen # Used to add information to music
    python39Packages.pip
    python39Packages.psutil
    python39Packages.setuptools

    ### Nix related stuff ###

    cachix                              # Compiled binary hosting for Nix
    #direnv                              # Manage directory environments
    #niv                                 # Dependency management for Nix
    nix-index                           # Locate packages
    #nix-prefetch-url                    # Prefetch url for override and overlays (add a url after nix-prefetch-url)
    #nix-prefetch-git                    # Same logic of nix-prefetch-url
    #nixpkgs-fmt                         # Nix code formatter for nixpkgs
    #nox                                 # Better nix searching
    #patchelf                            # Patches binaries for Nix support

    ### Android related stuff ###
    jmtpfs # sudo jmtpfs -o allow_other ~/DIRECTORY
    gphoto2
    #libmtp
    #mtpfs 

    ### Developement with yarn and kubernets ###
    #yarn
    #httpie
    #k9s
    #kubectx
    #kubernetes-helm
    #minikube

    ### VM dependencies ###
    bridge-utils
    kvm
    qemu
    virt-manager
    virt-viewer
    spice-vdagent

    ### DISABLED ###

    #docker-compose
    
    #gnupg pinentry

    #(texlive.combine {
    #  inherit (texlive)
    #    scheme-full
    #    minted
    #    pygmentex;
    #})

    #xtitle

  ] ++ user_pkgs ;
}
