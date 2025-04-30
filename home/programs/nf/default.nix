{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.makeNfDir = lib.mkAfter ''
    mkdir -p ~/journal
    mkdir -p ~/journal/rest
    chmod -R u+w ~/journal
  '';
}
