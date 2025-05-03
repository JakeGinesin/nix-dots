{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./synaptics/default.nix
    ./tailscale/default.nix
  ];
}
