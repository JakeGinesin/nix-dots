{
  config,
  pkgs,
  lib,
  ...
}: {
  home.activation.copyDir = lib.mkAfter ''
    mkdir -p ~/.wallpapers
    cp -r ${./pics}/* ~/.wallpapers/
    chmod -R u+w ~/.wallpapers/
  '';
}
