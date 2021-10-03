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
      sha256 = "137a51jmk2h9mrp959ds6n1gdgg7wmvwhjxjjd6njcs40k38rshj";

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
