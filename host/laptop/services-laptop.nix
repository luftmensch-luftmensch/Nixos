# Services specific for my thinkpad
{ lib, config, pkgs, ... }:
{
  services = {
    autorandr = {
      enable = true; 
    };

    logind = {
      lidSwitch = "suspend"; #don't suspend when lid is closed (other options are poweroff reboot hatl kexec suspend hibernate hybrid-sleep suspend-then-hiberante lock)
      lidSwitchDocked = "poweroff";
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
          id = "IFLTYUT-3K4K7H6-VIKT2FA-Q6R2DPV-Z7IDXMD-I2S2M2N-V6KNROL-N46VJQI"; # HOME
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
        CPU_SCALING_GOVERNOR_ON_BAT="schedutil";
        CPU_SCALING_GOVERNOR_ON_AC="performance";

        CPU_MAX_PERF_ON_AC=70;
        CPU_MAX_PERF_ON_BAT=60;
        #SOUND_POWER_SAVE_ON_AC = 0;
        #SOUND_POWER_SAVE_ON_BAT = 1;

        #CPU_MIN_PERF_ON_AC = 0;
        #CPU_MAX_PERF_ON_AC = 100;

        #CPU_MIN_PERF_ON_BAT = 0;
        #CPU_MAX_PERF_ON_BAT = 50;

        #CPU_BOOST_ON_AC = 1;
        #CPU_BOOST_ON_BAT = 1;
        #SCHED_POWERSAVE_ON_AC = 0;
        #SCHED_POWERSAVE_ON_BAT = 1;
        #ENERGY_PERF_POLICY_ON_AC = "performance";
        #ENERGY_PERF_POLICY_ON_BAT = "power";
        #RESTORE_DEVICE_STATE_ON_STARTUP = 0;
        #RUNTIME_PM_ON_AC = "on";
        #RUNTIME_PM_ON_BAT = "auto";
        #PCIE_ASPM_ON_AC = default;
        #PCIE_ASPM_ON_BAT = default;
        #USB_AUTOSUSPEND = 0;
      };
    };

    zfs = {
      trim = {
        enable = true;
      };

      #autoSnapshot = {
      #  enable = true;
      #};

      autoScrub = {
        enable = true;
        #interval = "weekly";
      };
    };
    
  };
}
