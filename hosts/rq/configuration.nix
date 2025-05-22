{
  config,
  pkgs,
  lib,
  ...
}: let
  pkg_with_working_nitrogen = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/c0c50dfcb70d48e5b79c4ae9f1aa9d339af860b4.tar.gz";
    sha256 = "17p3w4mgfr4yj2p0jz6kqgzhyr04h4fap5hnd837664xd1xhwdjb";
  }) {inherit (pkgs) system;};

  old-nitrogen = pkg_with_working_nitrogen.nitrogen;
in {
  # import system, hardware config, and home manager
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

    zsh_remote = lib.mkOption {
      type = lib.types.str;
      default = "1920x1080";
      description = "zsh remote secret";
    };
  };

  config = {
    networking.hostName = "rq"; # Define your hostname.
    res = "2560x1440";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.synchronous.imports = [../../home/home.nix];
    };

    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/nvme0n1";
    boot.loader.grub.useOSProber = true;
    boot.loader.grub.version = 2;
    services.logind.lidSwitchExternalPower = "ignore";

    age = {
      secrets.zsh_remote = {
        file = ../../secrets/zsh_remote.age;
        owner = "synchronous";
        mode = "0400";
      };
      secretsDir = "/home/synchronous/.agenix/agenix";
      secretsMountPoint = "/home/synchronous/.agenix/agenix.d";
      identityPaths = ["/home/synchronous/.ssh/id_ed25519"];
    };

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

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    users.users.synchronous = {
      isNormalUser = true;
      description = "jake";
      extraGroups = ["networkmanager" "wheel" "docker"];
      packages = with pkgs; [
        kdePackages.kate
        # firefox
        git
        arandr
        procs
        htop
        zsh
        ripgrep
        rofi
        alacritty
        python3
        tree
        old-nitrogen
        polybar
        sxhkd
        bspwm
        # librewolf
        eza
        flameshot
        neofetch
        lolcat
        nnn
        xclip
        brightnessctl
        xbindkeys
        pulseaudio
        xorg.xf86inputsynaptics
        libnotify # for notify-send
        alejandra
        discord
        legcord
        polybar-pulseaudio-control
        bluez # polybar
        zotero
        texliveFull
        texlivePackages.latexmk
        nmap
        procps # for pgrep
        # xorg.xrandr
        #  thunderbird
      ];
    };

    environment.systemPackages = with pkgs; [
      vim
      neovim
      linux-manual
      man-pages
      man-pages-posix
      fontconfig
      python3
      rofi
      flameshot
      tree
      # nitrogen
      polybar
      sxhkd
      bspwm
      # librewolf
    ];
  };
}
