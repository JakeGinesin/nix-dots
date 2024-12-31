{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./wm/bspwm.nix
    ./services/services.nix
  ];
}
