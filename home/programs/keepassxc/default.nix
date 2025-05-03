{
  config,
  pkgs,
  ...
}: {
  home.file.".config/keepassxc/keepassxc.ini".source = ./keepassxc.ini;
}
