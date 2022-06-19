# Services specific for my thinkpad
{ lib, config, pkgs, ... }:
{
  services = {
    #autorandr = {
    #  enable = true; 
    #};

    logind = {
      lidSwitch = "suspend"; #don't suspend when lid is closed (other options are poweroff reboot hatl kexec suspend hibernate hybrid-sleep suspend-then-hiberante lock)
      lidSwitchDocked = "poweroff";

      # idleaction with startx: https://bbs.archlinux.org/viewtopic.php?id=207536
      # <LeftMouse>https://wiki.archlinux.org/title/Power_management
      # Options: ttps://www.freedesktop.org/software/systemd/man/logind.conf.html

      #extraConfig = ''
      #  HandlePowerKey=suspend # or suspend-then-hibernate
      #  HandleSuspendKey=ignore
      #  HandleHibernateKey=ignore
      #  HandleLidSwitch=ignore
      #  HandleLidSwitchDocket=ignore
      #  IdleAction=suspend # or suspend-then-hibernate
      #  IdleActionSec=1m
      #'';
    };

    pipewire = { # In order to use it you need to set hardware.pulseaudio.enable = false
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
      #lowLatency.enable = true;
    };

    syncthing = {
      enable = true;
      user = "valentino";
      configDir = "/home/valentino/.config/syncthing";
      openDefaultPorts = true; # TCP 22000 for transfer, UDP 21027 for discovery 
      #relay.enable = true;
      devices = {
        P30-PRO = {
          id = "POGJUQZ-LA6JNGT-T7VN6AL-ZYVOEGE-HHNDWPN-6SXXULO-IQKO7KQ-6HNPBQP"; # P30-PRO
        };
        home = {
          id = "6WCFQRS-DS4JN3V-THYQYCP-IMP24WY-DC4OY2O-HJFU2B3-XTYTTRI-2EBU4QN"; # HOME
        };
        
      };
      folders = {
        "Music" = {
          path = "/home/valentino/Music";
          id = "n4gcw-3q7u5";
          devices = [ "home" ]; # home
        };

        "Dropbox" = {
          path = "/home/valentino/Dropbox";
          id = "tcfun-ya2ir";
          devices = [ "P30-PRO" "home" ]; # Multiple devices
        };

        "Video" = {
          path = "/home/valentino/Video";
          id = "tzf49-nwpwz";
          devices = [ "home" ]; # home
        };
        
      };
    };
    # TLP settings: https://linrunner.de/tlp/settings/index.html
    tlp = {
      enable = true;
      settings = {

        # CHARGE THRESHOLD - BAT #
        
        #"START_CHARGE_THRESH_BAT0" = 0;
        #"STOP_CHARGE_THRESH_BAT0" = 0;

        #"START_CHARGE_THRESH_BAT1" = 0;
        #"STOP_CHARGE_THRESH_BAT1" = 0;


        # AHCI OPTIONS #
        #AHCI_RUNTIME_PM_TIMEOUT=15;

        # BAY OPTIONS #
        #BAY_POWEROFF_ON_AC=0;
        #BAY_POWEROFF_ON_BAT=0;
        #BAY_DEVICE="sr0";

        # CPU - AC #
        CPU_SCALING_GOVERNOR_ON_AC="performance";
        CPU_MAX_PERF_ON_AC=70;
        #CPU_MIN_PERF_ON_AC = 0;
        #CPU_BOOST_ON_AC = 1;
        #CPU_ENERGY_PERF_POLICY_ON_AC="performance";
        #CPU_HWP_ON_AC = "performance";
        #CPU_HWP_DYN_BOOST_ON_AC=1;

        # CPU - BAT #
        CPU_SCALING_GOVERNOR_ON_BAT="schedutil";
        CPU_MAX_PERF_ON_BAT=60;
        #CPU_MIN_PERF_ON_BAT = 0;
        #CPU_BOOST_ON_BAT = 1;
        #CPU_ENERGY_PERF_POLICY_ON_BAT="power";
        #CPU_HWP_ON_BAT = "performance";
        #CPU_HWP_DYN_BOOST_ON_BAT=0;


        # DISK OPTIONS #

        #DISK_IDLE_SECS_ON_AC=0;
        #DISK_IDLE_SECS_ON_BAT=2;
        #DISK_DEVICES="sda sdb";
        #DISK_APM_LEVEL_ON_AC="254 254";
        #DISK_APM_LEVEL_ON_BAT="128 128";

        #"DISK_IOSCHED" = "mq-deadline mq-deadline";

        # DEVICES #
        #DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth wifi";
        #RESTORE_DEVICE_STATE_ON_STARTUP = 0;

        # USB OPTIONS #
        #USB_AUTOSUSPEND = 0;
        #USB_BLACKLIST_BTUSB=0;
        #USB_BLACKLIST_PHONE=0;
        #USB_BLACKLIST_PRINTER=1;
        #USB_BLACKLIST_WWAN=1;

        # ENERGY POLICY - AC #
        #ENERGY_PERF_POLICY_ON_AC = "performance";

        # ENERGY POLICY - BAT #
        #ENERGY_PERF_POLICY_ON_BAT = "power";

        # MODES #
        #TLP_DEFAULT_MODE = "AC";
        #TLP_PERSISTENT_DEFAULT=0;

        # MOST LOST WORK #
        #"MAX_LOST_WORK_SECS_ON_AC" = 15;
        #"MAX_LOST_WORK_SECS_ON_BAT" = 60;

        # NMI #
        #"NMI_WATCHDOG" = 0;

        # PLATFORM - PROFILE #
        #PLATFORM_PROFILE_ON_AC="performance";
        #PLATFORM_PROFILE_ON_BAT="low-power";
        
        # PCIE  - AC #
        #PCIE_ASPM_ON_AC = default;

        # PCIE  - BAT #
        #PCIE_ASPM_ON_BAT = default;


        # RADEON OPTIONS #
        #RADEON_POWER_PROFILE_ON_AC=high;
        #RADEON_POWER_PROFILE_ON_BAT=low;
        #RADEON_DPM_STATE_ON_AC=performance;
        #RADEON_DPM_STATE_ON_BAT=battery;
        #RADEON_DPM_PERF_LEVEL_ON_AC=auto;
        #RADEON_DPM_PERF_LEVEL_ON_BAT=auto;


        # RUNTIME PM - AC #
        #RUNTIME_PM_ON_AC = "on";

        # RUNTIME PM - BAT #
        #RUNTIME_PM_ON_BAT = "auto";

        # SATA DISK #
        #"SATA_LINKPWR_ON_AC" = "med_power_with_dipm max_performance";
        #"SATA_LINKPWR_ON_BAT" = "min_power min_power med_power_with_dipm";

        # SCHED - AC #
        #SCHED_POWERSAVE_ON_AC = 0;

        # SCHED - BAT #
        #SCHED_POWERSAVE_ON_BAT = 1;

        #     SOUND      #
        #"SOUND_POWER_SAVE_CONTROLLER" = "Y";

        # SOUND - AC #
        #SOUND_POWER_SAVE_ON_AC = 0;

        # SOUND - BAT #
        #SOUND_POWER_SAVE_ON_BAT = 1;


        # WAKE ON LAN #
        #"WOL_DISABLE" = "Y";
        
        # WIFI - AC #
        #WIFI_PWR_ON_AC = "off";

        # WIFI - BAT #
        #WIFI_PWR_ON_BAT = "on";


      };
    };
    
  };

  # In addition to logind suspend on lid switch enable a service to lock the screen before suspend
  systemd.services."screen-locker" = {
    enable = true;
    description = "Lock the screen before suspend.";
    before = ["suspend.target"];
    wantedBy = ["suspend.target"  ]; #"suspend.target"
    serviceConfig = {
      Type = "simple";
      Environment = "DISPLAY=:1 WAYLAND_DISPLAY=wayland-1 XDG_RUNTIME_DIR=/run/user/1000";
      #User = "%I";
      ExecStart = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --ignore-empty-password --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 0F0F0F --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 2 --fade-in 0.2";
    };
  };
}
