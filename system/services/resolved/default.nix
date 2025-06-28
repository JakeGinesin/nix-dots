{
  config,
  pkgs,
  ...
}: {
  networking.nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];

  services.resolved = {
    # extraConfig = ''
    # DNS=127.0.0.1:53535           # resolved → dnsmasq, non-standard port OK
    # '';
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
    dnsovertls = "true";
  };
}
