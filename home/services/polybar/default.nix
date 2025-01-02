{
  config,
  pkgs,
  ...
}: {
  services.polybar = {
    enable = true;
    extraConfig = builtins.readFile ./config.ini;
    script = ''
      polybar -c /home/synchronous/.config/polybar/config.ini mybar & disown
    '';
  };
}
