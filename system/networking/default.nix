{
  config,
  pkgs,
  ...
}: {
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking = {
    hosts = {
      "127.0.0.1" = ["localhost"];
    };

    networkmanager = {
      enable = true;
      dispatcherScripts = [
        {
          source = ./blockers.sh;
          type = "basic";
        }
      ];
    };

    # interfaces = {
    # enp0s31f6 = {};
    # wlp4s0 = {};
    # };

    # ensures wireless is wlan0, eth is eth0;
    # predictable interfaces is kinda sussy innit?
    usePredictableInterfaceNames = false;
  };
}
