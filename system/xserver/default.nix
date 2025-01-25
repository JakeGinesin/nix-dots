{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";

    # displayManager.defaultSession = "bspwm";
    desktopManager.xterm.enable = false;

    # windowManager.bspwm = {
    # enable = true;
    # # extraConfig = builtins.readFile ./bspwmrc;
    # # configFile = ./bspwmrc; # relative import to preserve locality of config
    # # package = "bspwm-unstable";
    # # sxhkd.package = "sxhkd-unstable";
    # # sxhkd.configFile = ./sxhkdrc;
    # };

    displayManager = {
      # autoLogin.user = "synchronous";
      # autoLogin.enable = true;

      lightdm = {
        enable = true;
        greeters.gtk.enable = true;
      };
    };
  };

  # xsession.windowManager.bspwm = {
  #   enable = true;
  #   extraConfig = builtins.readFile ./bspwmrc;
  # };

  # services.sxhkd.enable = true;
  # services.sxhkd.extraConfig = builtins.readFile ./sxhkdrc;

  # services.displayManager.autoLogin.enable = true;

  # services.displayManagrer.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # }
}
