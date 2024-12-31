{
  config,
  pkgs,
  ...
}: {
  home.file.".xbindkeysrc".source = ./xbindkeysrc;
}
