{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    guiAddress = "localhost:8384";
    # user = "synchronous";
    # group = "syncthing";
    openDefaultPorts = true;
  };
}
