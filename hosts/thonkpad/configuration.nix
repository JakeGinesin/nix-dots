# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: let
  pkg_with_working_nitrogen = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/c0c50dfcb70d48e5b79c4ae9f1aa9d339af860b4.tar.gz";
    sha256 = "17p3w4mgfr4yj2p0jz6kqgzhyr04h4fap5hnd837664xd1xhwdjb";
  }) {inherit (pkgs) system;};

  old-nitrogen = pkg_with_working_nitrogen.nitrogen;
in {
  imports = [
    ./hardware-configuration.nix
    ../../system/system.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.synchronous = import ../../home/home.nix;
  };

  # Bootloader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sda";
  # boot.loader.grub.useOSProber = true;
  # boot.loader.grub.version = 2;
  #boot = {
  #  loader.systemd-boot = {
  #    enable = true;
  #    editor = false;
  #  };
  #  kernelPackages = pkgs.linuxPackages;
  #};
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;

  networking.hostName = "thonkpad"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix = {
    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=/home/synchronous/nix-cfg/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  programs.dconf.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.synchronous = {
    isNormalUser = true;
    description = "jake";
    extraGroups = ["networkmanager" "wheel"];
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

  security.sudo = {
    # me ne frego. i dare you to privilege escalate me
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "/home/synchronous/nix-cfg/home/scripts/nixos-rebuild.sh";
            options = ["NOPASSWD"];
          }
          {
            command = "/home/synchronous/.scripts/nixos-rebuild.sh";
            options = ["NOPASSWD"];
          }
          {
            # are you serious?
            command = "/run/current-system/sw/bin/nixos-rebuild switch --flake /home/synchronous/nix-cfg/flake.nix";
            options = ["NOPASSWD"];
          }
        ];
        users = ["synchronous"];
      }
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
