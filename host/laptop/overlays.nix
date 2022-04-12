{ lib, config, pkgs, ... }:
{

  ### NIXPKGS OVERLAYS - TOUCHEGG ###
  #nixpkgs.overlays = [
  #  (self: super:
  #    {
  #      touchegg = super.touchegg.overrideAttrs (old: rec {
  #        #version = "2.0.9";
  #        version = "2.0.14";

  #        src = super.fetchzip {
  #          url = "https://github.com/JoseExposito/touchegg/archive/${version}.zip";
  #          #sha256 = "sha256-dIUAN65grsFiCF1iDI2hDJQUtLmXxJ/1qAl/55NzRc0=";
  #          sha256 = "1h6c9mn7b77s50bi959nslcgmf8a443h5l2sfjshpl80jkf3gksm";
  #        };

  #        PKG_CONFIG_SYSTEMD_SYSTEMDSYSTEMUNITDIR = "${placeholder "out"}/lib/systemd/system";

  #        buildInputs = with super; [
  #          systemd
  #          libinput
  #          pugixml
  #          cairo
  #          gtk3-x11
  #          pcre
  #        ] ++ (with xorg; [
  #          libX11
  #          libXtst
  #          libXrandr
  #          libXi
  #          libXdmcp
  #          libpthreadstubs
  #          libxcb
  #        ]);

  #        nativeBuildInputs = with super; [ pkg-config cmake ];

  #        preConfigure = "";
  #      });
  #    })

  #];

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

