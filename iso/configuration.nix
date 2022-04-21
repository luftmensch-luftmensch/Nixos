{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];

  #users.users.root.openssh.authorizedKeys.keys = [
  #"ssh-ed25519 AaAeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee username@host" # Take from the id_rsa.pub file on ~/.ssh
  #];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
