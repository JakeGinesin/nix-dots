{
  pkgs,
  lib,
  ...
}: {
  # programs.rofi = {
  #    enable = true;
  # configPath = "./config.rasi";
  # };

  home.file.".config/rofi/config.rasi".source = ./config.rasi;

  home.activation.copyRofiDir = lib.mkAfter ''
    mkdir -p ~/.config/rofi/styles
    cp -r ${./styles}/* ~/.config/rofi/styles/
    chmod -R u+w ~/.config/rofi/styles/
  '';
}
