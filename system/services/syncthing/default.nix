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
        cluster = {
          id = "WLJQSWD-IGXNYPW-2OMCGM4-N2M5MSN-6Z6TRDA-VLZGWVC-5PJTO5U-BPFFCAU";
          addresses = [
            "tcp://100.117.155.3:22000"
            "dynamic"
          ];
        };
        SM-G398FN = {
          id = "AKNMO2T-YYTTUL2-463A4VU-37ZULQO-E4EKIYG-VGKV4RI-S4PVP3J-CMAQ6Q7";
          addresses = [
            "dynamic"
          ];
        };
      };
      folders = {
        notes = {
          id = "journal";
          label = "journal";
          path = "/home/synchronous/journal";
          type = "sendreceive";

          devices = ["cluster" "SM-G398FN"];
        };
      };
    };
  };
}
