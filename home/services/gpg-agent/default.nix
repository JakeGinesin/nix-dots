{
  config,
  pkgs,
  ...
}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    #TODO: determine if extraConfig is necessary for emacs.
  };
}
