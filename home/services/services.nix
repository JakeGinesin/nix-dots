{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./picom/default.nix
    ./dunst/default.nix
    ./polybar/default.nix
  ];
}
