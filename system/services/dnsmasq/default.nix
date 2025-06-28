{
  config,
  pkgs,
  ...
}: {
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    settings = {
      conf-dir = "/var/lib/dnsmasq/conf.d";
      listen-address = "127.0.0.1";
      server = ["1.1.1.1" "1.0.0.1"];
    };
  };
}
