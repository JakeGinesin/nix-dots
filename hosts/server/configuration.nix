{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/system.nix
    ../meta.nix
    ./ssh.nix
  ];

  config = {
    networking.hostName = "server"; # Define your hostname.
    res = "2560x1440";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.synchronous.imports = [../../home/home.nix];
    };

    age = {
      secrets = {
        zsh_remote = {
          file = ../../secrets/zsh_remote.age;
          owner = "synchronous";
          mode = "0400";
        };
        tailscale-rq = {
          file = ../../secrets/tailscale-rq.age;
          owner = "synchronous";
          mode = "0400";
        };
        ssh-pub = {
          file = ../../secrets/ssh-pub.age;
          owner = "synchronous";
          mode = "0400";
        };
      };
      secretsDir = "/home/synchronous/.agenix/agenix";
      secretsMountPoint = "/home/synchronous/.agenix/agenix.d";
      identityPaths = ["/home/synchronous/.ssh/id_ed25519"];
    };

    # Bootloader.
    # boot.loader.grub.enable = true;
    # boot.loader.grub.device = "/dev/nvme0n1";
    # boot.loader.grub.useOSProber = true;
    # boot.loader.grub.version = 2;
    # services.logind.lidSwitchExternalPower = "ignore";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = false;

    #boot = {
    #  loader.systemd-boot = {
    #    enable = true;
    #    editor = false;
    #  };
    #  kernelPackages = pkgs.linuxPackages;
    #};
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;
    # boot.loader.grub.enable = false;
  };
}
