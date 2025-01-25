{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    extraConfig = builtins.readFile ./zathurarc;
  };
}
