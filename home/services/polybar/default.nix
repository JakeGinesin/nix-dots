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
      polybar -q -r -c /home/synchronous/.config/polybar/config.ini mybar > /tmp/polybar & disown
    '';
  };

  home.activation.polybarStartup = lib.hm.dag.entryAfter ["linkGeneration"] ''
    polybar -q -r -c /home/synchronous/.config/polybar/config.ini mybar > /tmp/polybar & disown
  '';
}
