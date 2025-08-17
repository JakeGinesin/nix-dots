{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/system.nix
  ];

  options = {
    res = lib.mkOption {
      type = lib.types.str;
      default = "1920x1080";
      description = "screen resolution";
    };
  };

  config = {
    networking.hostName = "thonkpad"; # Define your hostname.
    res = "1366x768";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "hm-backup";
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

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub.enable = false;
  };
}
