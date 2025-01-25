{
  config,
  pkgs,
  lib,
  ...
}: {
  xsession.windowManager.bspwm = {
    enable = true;
    extraConfig = builtins.readFile ./bspwmrc;
  };

  # services.xserver.windowManager.bspwm.enable = true;

  # home.file.".config/bspwm/bspwmrc".source = ./bspwmrc;

  # home.activation.sourceMyScript = lib.mkAfter ''
  # source "${config.xdg.configHome}/bspwm/bspwmrc"
  # '';
}
