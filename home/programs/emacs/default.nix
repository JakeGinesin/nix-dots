{
  config,
  pkgs,
  callPackage,
  ...
}: {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];

  services.emacs.package = pkgs.emacs-unstable;
  services.emacs.enable = true;
}
