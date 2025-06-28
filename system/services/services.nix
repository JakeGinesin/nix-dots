{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./synaptics/default.nix
    ./tailscale/default.nix
    ./syncthing/default.nix
    ./resolved/default.nix
  ];
}
