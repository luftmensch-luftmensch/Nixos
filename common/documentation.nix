{ config, ... }: {
  documentation = {

    nixos = {
      enable = false; # remove bloatware (NixOS HTML file)
    };

    man = {
      enable = true;
      # This allows searching for a page or keyword using utilities
      # like apropos(1) and the -k option of man(1)
      generateCaches = true;
    };

    dev = {
      enable = true;
    };
  };
}
