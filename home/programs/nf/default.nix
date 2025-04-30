{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.makeNfDir = lib.mkAfter ''
    mkdir -p ~/journal
    chmod -R u+w ~/journal
  '';
}
