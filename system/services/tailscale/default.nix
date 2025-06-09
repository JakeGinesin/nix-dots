{
  config,
  pkgs,
  ...
}: {
  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-rq.path;

    # builtins.readFile config.age.secrets.tailscale-rq.path;
  };
}
