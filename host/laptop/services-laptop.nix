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

      #extraConfig = ''
      #  HandlePowerKey=suspend
      #  IdleAction=suspend
      #  IdleActionSec=1m
      #'';
    };

    #pipewire = { # In order to use it you need to set hardware.pulseaudio.enable = false
    #  enable = true;
    #  alsa.enable = true;
    #  alsa.support32Bit = true;
    #  jack.enable = true;
    #  pulse.enable = true;
    #  #lowLatency.enable = true;
    #};

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

    tlp = {
      enable = true;
      settings = {

        # CPU - AC #
        CPU_SCALING_GOVERNOR_ON_AC="performance";
        CPU_MAX_PERF_ON_AC=70;
        #CPU_MIN_PERF_ON_AC = 0;
        #CPU_MAX_PERF_ON_AC = 100;
        #CPU_BOOST_ON_AC = 1;
        #CPU_HWP_ON_AC = "performance";

        # CPU - BAT #
        CPU_SCALING_GOVERNOR_ON_BAT="schedutil";
        CPU_MAX_PERF_ON_BAT=60;
        #CPU_MIN_PERF_ON_BAT = 0;
        #CPU_MAX_PERF_ON_BAT = 50;
        #CPU_BOOST_ON_BAT = 1;
        #CPU_HWP_ON_BAT = "performance";


        # DEVICES #
        #DEVICES_TO_ENABLE_ON_STARTUP = "bluetooth wifi";
        #RESTORE_DEVICE_STATE_ON_STARTUP = 0;
        #USB_AUTOSUSPEND = 0;

        # ENERGY POLICY - AC #
        #ENERGY_PERF_POLICY_ON_AC = "performance";

        # ENERGY POLICY - BAT #
        #ENERGY_PERF_POLICY_ON_BAT = "power";

        # MODES #
        #TLP_DEFAULT_MODE = "AC";

        # PCIE  - AC #
        #PCIE_ASPM_ON_AC = default;

        # PCIE  - BAT #
        #PCIE_ASPM_ON_BAT = default;

        # RUNTIME PM - AC #
        #RUNTIME_PM_ON_AC = "on";

        # RUNTIME PM - BAT #
        #RUNTIME_PM_ON_BAT = "auto";

        # SCHED - AC #
        #SCHED_POWERSAVE_ON_AC = 0;

        # SCHED - BAT #
        #SCHED_POWERSAVE_ON_BAT = 1;

        # SOUND - AC #
        #SOUND_POWER_SAVE_ON_AC = 0;

        # SOUND - BAT #
        #SOUND_POWER_SAVE_ON_BAT = 1;

        # WIFI - AC #
        #WIFI_PWR_ON_AC = "off";

        # WIFI - BAT #
        #WIFI_PWR_ON_BAT = "on";


      };
    };
    
  };
}
