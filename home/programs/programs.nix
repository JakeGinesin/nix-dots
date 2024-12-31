{
  config,
  pkgs,
  ...
}: {
  programs.home-manager.enable = true;

  imports = [
    ./alacritty/default.nix
    ./zsh/default.nix
    ./bspwm/default.nix
    ./cmus/default.nix
    # ./nitrogen/defualt.nix
    ./rofi/default.nix

    ./sxhkd/default.nix
    ./bspwm/default.nix

    ./xbindkeys/default.nix
  ];
}
