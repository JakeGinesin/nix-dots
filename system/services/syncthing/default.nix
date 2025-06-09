{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    # user = "synchronous";
    # group = "syncthing";
    openDefaultPorts = true;
  };
}
