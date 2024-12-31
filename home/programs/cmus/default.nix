{
  config,
  pkgs,
  ...
}: {
  home.file.".config/cmus/rc".source = ./rc;
  home.file.".config/cmus/autosave".source = ./autosave;
}
