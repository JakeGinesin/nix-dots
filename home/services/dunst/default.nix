{
  config,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    # configFile = ./dunstrc;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x50";
        scale = 0;
        notification_limit = 0;
        progress_bar = true;
      };
    };
  };
}
