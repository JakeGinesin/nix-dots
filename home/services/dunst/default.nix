{
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    configFile = ./dunstrc;
  };
}
