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
      sha256 = "0mdgyjsmg1ldmqhqqrzqyspkfxm02rhcm8b7cvnl6g0bs2b3j3y6";
      #sha256 = "08ss5ppp8zyln80qkvzk5fk7jr1pj8bk6g8mlnz012rwc3yp1b8m";

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
