{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    beets
  ];
  home.file.".config/beets/config.yaml".source = ./config.yaml;
}
