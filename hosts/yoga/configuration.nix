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
  };

  config = {
    networking.hostName = "yoga"; # Define your hostname.
    res = "1920x1080";

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.synchronous.imports = [../../home/home.nix];
    };

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

    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot";
    services.logind.lidSwitchExternalPower = "ignore";
    boot.loader.systemd-boot.enable = true;

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
