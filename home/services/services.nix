{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./picom/default.nix
    ./dunst/default.nix
    # ./gpg-agent/default.nix
    # ./tailscale/default.nix
  ];
}
