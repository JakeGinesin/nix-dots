{
  config,
  pkgs,
  ...
}: {
  services.sxhkd.enable = true;
  services.sxhkd.extraConfig = builtins.readFile ./sxhkdrc;

  # home.file.".config/sxhkd/sxhkdrc".source = ./sxhkdrc;
}
