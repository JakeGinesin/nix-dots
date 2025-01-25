{
  builtins,
  lib,
  ...
}: {
  programs.zathura = {
    enable = true;
    extraConfig = ./zathurarc;
  }
}
