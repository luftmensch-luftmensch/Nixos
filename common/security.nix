{ config, lib, ... }:

# security tweaks borrowed from @hlissner

{
  ## System security tweaks
  # sets hidepid=2 on /proc (make process info visible only to owning user)
  # NOTE Was removed on nixpkgs-unstable because it doesn't do anything
  # security.hideProcessInformation = true;
  # Prevent replacing the running kernel w/o reboot
  security.protectKernelImage = true;

  # tmpfs = /tmp is mounted in ram. Doing so makes temp file management speedy
  # on ssd systems, and volatile! Because it's wiped on reboot.
  boot.tmpOnTmpfs =  true;
  # If not using tmpfs, which is naturally purged on reboot, we must clean it
  # /tmp ourselves. /tmp should be volatile storage!
  #boot.cleanTmpDir = lib.mkDefault (!config.boot.tmpOnTmpfs);

  boot.kernel.sysctl = {
    # The Magic SysRq key is a key combo that allows users connected to the
    # system console of a Linux kernel to perform some low-level commands.
    # Disable it, since we don't need it, and is a potential security concern.
    "kernel.sysrq" = 0;
    #"kernel.printk" = "3 4 3 3"; # don't let logging bleed into TTY

    ## TCP hardening
    # Prevent bogus ICMP errors from filling up logs.
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;

    #"net.ipv4.icmp_echo_ignore_broadcasts" = 1; # Refuse ICMP echo requests on my desktop/laptop; nobody has any business  pinging them, unlike my servers.

    # Reverse path filtering causes the kernel to do source validation of
    # packets received from all interfaces. This can mitigate IP spoofing.
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    # Do not accept IP source route packets (we're not a router)
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    # Don't send ICMP redirects (again, we're on a router)
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    # Refuse ICMP redirects (MITM mitigations)
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    #"net.ipv6.conf.all.use_tempaddr" = 2;

    # Protects against SYN flood attacks
    "net.ipv4.tcp_syncookies" = 1;
    # Incomplete protection again TIME-WAIT assassination
    "net.ipv4.tcp_rfc1337" = 1;

    ## TCP optimization
    # TCP Fast Open is a TCP extension that reduces network latency by packing
    # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
    # both incoming and outgoing connections:
    "net.ipv4.tcp_fastopen" = 3;
    # Bufferbloat mitigations + slight improvement in throughput & latency
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";

    #"vm.swappiness" = 0; # or 10
    
    # Intel GPU Analysis
    #"dev.i915.perf_stream_paranoid" = 0;

  };

  # sudo & doas
  security = {
    #  doas = {
    #    enable = true;
    #    extraRules = [{ users = [ "USER" ]; persist = true; keepEnv = true; noPass = true; }];
    #    
    #  };
    sudo.wheelNeedsPassword = false;
    # Whether to enable the RealtimeKit system service, which hands out realtime scheduling priority to user processes on demand.
    # For example, the PulseAudio server uses this to acquire realtime priority. 
    rtkit = { 
      enable = true; # Recommended for pipewire
    };
  };
}
