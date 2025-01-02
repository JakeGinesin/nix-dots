{
  config,
  pkgs,
  ...
}: {
  services.polybar = {
    enable = true;
    config = ./config.ini;
    script = ''
      polybar mybar &
    '';
  };
}
