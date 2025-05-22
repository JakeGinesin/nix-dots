{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./wm/bspwm.nix
    ./xserver/default.nix
    ./services/services.nix
    ./fonts/fonts.nix
    ./hardware/hardware.nix
    ./networking/default.nix
  ];
}
