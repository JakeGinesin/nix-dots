{
  config,
  pkgs,
  ...
}: {
  # services.xserver.dpi = 180;
  # services.dbus.enable = true;
  security.polkit.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";

    displayManager.defaultSession = "none+bspwm";
    desktopManager.xterm.enable = false;

    windowManager.bspwm.enable = true;

    displayManager = {
      # autoLogin.user = "synchronous";
      # autoLogin.enable = true;

      # lightdm = {
      #   enable = true;
      #   greeters.gtk.enable = true;
      # };
      sddm = {
        enable = true;
      };
    };
  };
}
