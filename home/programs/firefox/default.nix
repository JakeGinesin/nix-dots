{
  pkgs,
  lib,
  ...
}: {
  programs.firefox = {
    enable = true;
  };

  programs.librewolf.enable = true;
}
