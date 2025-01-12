{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configuration/hardware-configuration.nix
    ./power-management/default.nix
  ];
}
