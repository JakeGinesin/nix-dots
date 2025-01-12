{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/bspwm.nix
    ./services/services.nix
    ./fonts/fonts.nix
  ];
}
