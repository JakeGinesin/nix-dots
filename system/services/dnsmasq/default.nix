{
  config,
  pkgs,
  lib,
  ...
}: {
  system.activationScripts.dnsmasqConfd = lib.stringAfter ["var"] ''
    mkdir -p /var/lib/dnsmasq/conf.d
  '';

  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    settings = {
      conf-dir = "/var/lib/dnsmasq/conf.d";
      listen-address = "127.0.0.1";
      resolv-file = "/dev/null"; # god fuck you fuck you fuck you tailscale + systemd-resolved + dnsmasq it took me *three hours* at 3am to get this one working
      server = ["1.1.1.1" "1.0.0.1"];
    };
  };

  services.resolved.enable = false;
}
