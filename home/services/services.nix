{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./picom/default.nix
    ./dunst/default.nix
  ];
}
