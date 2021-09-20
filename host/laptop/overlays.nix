{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS ###
  nixpkgs.overlays = [
    (self: super:
      {
        touchegg = super.touchegg.overrideAttrs (old: rec {
          version = "2.0.9";

          src = super.fetchzip {
            url = "https://github.com/JoseExposito/touchegg/archive/${version}.zip";
            sha256 = "sha256-dIUAN65grsFiCF1iDI2hDJQUtLmXxJ/1qAl/55NzRc0=";
          };

          PKG_CONFIG_SYSTEMD_SYSTEMDSYSTEMUNITDIR = "${placeholder "out"}/lib/systemd/system";

          buildInputs = with super; [
            systemd
            libinput
            pugixml
            cairo
            gtk3-x11
            pcre
          ] ++ (with xorg; [
            libX11
            libXtst
            libXrandr
            libXi
            libXdmcp
            libpthreadstubs
            libxcb
          ]);

          nativeBuildInputs = with super; [ pkg-config cmake ];

          preConfigure = "";
        });
      })
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      #sha256= "0000000000000000000000000000000000000000000000000000";
      #sha256 = "1p2ikx5krrz6r0x1jyfcb3jvj7yl3pz2l4lz5ilffr6pj1swwlk2";
      sha256 = "1xfz4mg7yvn79ap19kab7m1bmcna8nzyr15j9fywjxgnr0z468dw";
      

    }))


  ];

  systemd.services.touchegg = {
    enable = true;
    description = "Touchégg. The daemon.";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      Group = "input";
      Restart = "on-failure";
      RestartSec = 5;
      ExecStart = "${pkgs.touchegg}/bin/touchegg --daemon";
    };
  };
  systemd.user.services.touchegg-client = {
    description = "Touchégg. The client.";

    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      Restart = "on-failure";
      ExecStart = "${pkgs.touchegg}/bin/touchegg";
    };
  };
  
}
