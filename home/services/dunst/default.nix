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
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 1;
        frame_color = "#636363";
        separator_color = "frame";
        sort = "yes";
        font = "Monospace 8";
        line_height = 0;
        markup = "full";
        geometry = "300x2-30+20";
        shrink = "yes";
      };
    };
  };
}
