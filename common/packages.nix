#{ pkgs, inputs, lib, config, ... }: # Enable only when using two different version of nixpkgs (stable/unstable) at once
{ pkgs, lib, config, ... }:
let
  # lib.optionals (config.networking.hostName == "home")
  user_pkgs = with pkgs; if (config.networking.hostName == "home") then [
    dmidecode # Tool per ricavare le informazioni sull'hardware del computer contenute nel BIOS
    gimp-with-plugins
    imv
    libreoffice
    linuxPackages.cpupower
    parcellite # Substitute of clipman
    picom
    polybarFull
    plymouth # enable also the boot option
    scrot # Screenshot utility on Xorg
    vimHugeX # vim with X clipboard

    xautolock
    xclip
    xorg.xev
    xorg.xkill
    xorg.xrdb
    xss-lock
    xfce.xfce4-screenshooter

    # QEMU
    #edk2
    #libvirt
    #OVMF

  ] else [
    acpi # information about battery
    #autorandr # manage multiple screen (Xorg)
    brightnessctl # manage brightness
    neovim
    pulseaudio
    wireguard-tools
    tree-sitter # needed for neovim (language syntax highlighting)
    touchegg
  ];

  additional_pkgs_with_flags = with pkgs; [
    (writeScriptBin "emacs-daemon" ''
      ${pkgs.emacs}/bin/emacs --fg-daemon
    '')
  ];

  wayland_custom_pkgs = with pkgs; lib.optionals (config.networking.hostName == "PC") [
    (ungoogled-chromium.override {
      commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WebRTCPipeWireCapturer --enable-usermedia-screen-capturing";
    })
  ];

  #unstable_pkgs = with pkgs; [
  #  inputs.nixos-unstable.legacyPackages.${pkgs.system}.emacs
  #  inputs.nixos-unstable.legacyPackages.${pkgs.system}.librewolf # Waiting for this issue -> https://github.com/NixOS/nixpkgs/issues/172415
  #  inputs.nixos-unstable.legacyPackages.${pkgs.system}.neovim
  #];
in
{
  environment.systemPackages = with pkgs; [
    # Cli programs 

    ### A ###
    alacritty
    #android-file-transfer
    #androidStudioPackages.dev
    #anydesk
    #ark
    #aspell aspellDicts.it # (moved to hunspell)
    autotiling # Manual to dynamic TWM (i3/sway)
    #appimage-run

    ### B ###
    bat
    #bc
    #betterlockscreen
    bind
    bitwarden #bitwarden-cli
    bluez
    #breeze-gtk
    #breeze-qt5
    #bmon # Network Bandwidth Monitoring and Debugging Tool

    ### C ###
    capitaine-cursors
    #carla
    #chromium
    #colorpicker

    ### D ###
    #dbeaver # A better alternative to PGAdmin
    #devour # Enable terminal swallowing (used for zathura) # Only for X11
    dunst
    
    ### E ###
    #inputs.nixos-unstable.legacyPackages.${pkgs.system}.emacs
    #emacsPgtkGcc
    # From trace: emacsPgtkGcc has been renamed to emacsPgtkNativeComp
    #emacsPgtkNativeComp # Needed an overlay for this! (emacs 29 with Pgtk + Gcc)
    emacs
    exa
    exiftool # Used for emms

    ### F ###
    fd # Alternative to find (much faster)
    feh
    firefox
    filezilla
    ffmpeg
    fish
    #foliate # Minimal E-Book reader
    #fortune
    #freetube # FOSS private YT app

    ### G ###
    git
    # gitAndTools.gitFull

    gnome.adwaita-icon-theme
    gtk3 # In substitution of gnome.gtk (removed on 13-01-2022)
    gnome3.gnome-disk-utility
    #guvcview #(camera preview)
    #gotop

    ### H ###
    #haskellPackages.greenclip
    htop
    hugo

    # Spell checking for flyspell
    hunspell
    hunspellDicts.it_IT
    hunspellDicts.en_US

    ### J ###
    #jetbrains.idea-community

    ### K ###
    #kdenlive
    #killall
    #kicad # A Cross Platform and Open Source Electronics Design Automation Suite
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
    maven
    #mkpasswd # Generates passwords and can apply them automatically to users
    #mpg123 # Used for dunst sound notifications
    mpv
    mu

    ### N ###
    #netbeans
    networkmanagerapplet
    nmap
    nodejs #nodePackages."@vue/cli" # (Used at work, not used atm)
    #nvtop

    #ncdu # like du but interactive

    ### O ###
    obs-studio
    #onedrive
    #openvpn # VPN -> used as service
    openssl

    ### P ###
    pamixer # Used in i3
    pandoc
    papirus-icon-theme
    pavucontrol
    #pcmanfm
    poppler 
    #postgresql_13
    #postman
    #progress

    ### Q ###
    qt5ct
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.breeze-qt5

    qrcp
    #qutebrowser

    ### R ###
    #ranger # No more used
    ripgrep
    rofi

    ### S ###
    scrcpy
    shellcheck
    speedtest-cli
    spotify
    sqlite
    #sshpass
    #steam steam-run-native # Gaming

    #stow
    #skippy-id # (exposè function)
    #superTuxKart

    ### T ###
    #teamviewer
    tdesktop
    #telnet
    thunderbird # Email client
    traceroute

    texlive.combined.scheme-full

    ### U ###
    #udiskie #(udisks2 frontend)
    #ueberzug # (Needed for ranger (disabled) - Work only on Xorg)

    # chrome://flags/#enable-webrtc-pipewire-capturer (Enable it to share entire screen)
    ungoogled-chromium # Fix to screen sharing under wayland (chromium crashed when trying to stream)
    #unrar
    unzip
    #usbguard # Protect against infected USB
    usbutils

    ### V ###
    #vault # (bitwarden alternative)
    #viewnior
    #virt-viewer 
    #vscode

    ### W ###
    wget
    #wireguard # VPN -> used as service

    ### X ###
    xdg-user-dirs
    xdotool
    xfce.thunar # Need xfce.tumbler
    xfce.thunar-archive-plugin
    #xfce.thunar-volman # automatic management of removable drives and media
    xfce.tumbler

    ### Y ###
    #youtube-dl
    yt-dlp # Youtube-dl fork
    #yuzu-mainline # nintendo switch emulator

    ### Z ###
    zathura  
    zip

    # Programming
    ccls clang_11 cmake gcc #gdb
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

    cachix                               # Compiled binary hosting for Nix
    #direnv                              # Manage directory environments
    #niv                                 # Dependency management for Nix
    nix-index                            # Locate packages
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
    #bridge-utils
    #kvm
    #qemu
    #virt-manager
    #virt-viewer
    #spice-vdagent

    ### DISABLED ###

    #docker-compose
    
    #gnupg pinentry

    #(texlive.combine {
    #  inherit (texlive)
    #    scheme-full
    #    minted
    #    pygmentex;
    #})

  ] ++ user_pkgs ++ additional_pkgs_with_flags ++ wayland_custom_pkgs ; #++ unstable_pkgs;
}
