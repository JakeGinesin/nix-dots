{
  config,
  pkgs,
  lib,
  ...
}: let
  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };
in {
  services.polybar = {
    enable = true;
    package = mypolybar;
    extraConfig = builtins.readFile ./config.ini;
    # unholy
    script = ''
      # echo "none"
      exec /etc/profiles/per-user/synchronous/bin/polybar mybar & disown
    '';
  };

  # home.activation.polybarStartup = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   exec /etc/profiles/per-user/synchronous/bin/polybar -c /home/synchronous/.config/polybar/config.ini mybar & disown
  # '';
}
