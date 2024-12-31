{
  config,
  pkgs,
  ...
}: {
  home.file.".config/nitrogen/nitrogen.cfg".source = ./nitrogen.cfg;
}
