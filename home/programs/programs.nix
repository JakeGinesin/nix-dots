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
    ./polybar/default.nix

    ./sxhkd/default.nix
    ./bspwm/default.nix

    ./xbindkeys/default.nix
    ./nvim/default.nix
    ./firefox/default.nix
  ];
}
