{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    guiAddress = "localhost:8384";
    user = "synchronous";
    group = "users";
    dataDir = "/home/synchronous";
    # user = "synchronous";
    # group = "syncthing";
    openDefaultPorts = true;

    settings = {
      devices = {
        cluster = {id = "RBT7JA4-DFQ33SG-JUWJOQ2-MLPVLV4-SL2NATS-VZBB5M5-L7CHO3N-UTBOGA4";};
      };
      folders = {
        notes = {
          id = "journal";
          label = "journal";
          path = "/home/synchronous/journal";
          type = "sendreceive";

          devices = ["cluster"];
        };
      };
    };
  };
}
