{
  config,
  pkgs,
  lib,
  ...
}: {
  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./config.ini;
    script = ''
      polybar mybar & disown
    '';
  };

  #home.activation.polybarStartup = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #  polybar -c /home/synchronous/.config/polybar/config.ini mybar & disown
  #'';
}
