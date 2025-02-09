{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  # home.packages = builtins.attrValues scriptDerivations;

  home.username = "synchronous";
  home.homeDirectory = "/home/synchronous";
  imports = [
    ./programs/programs.nix
    ./services/services.nix
    ./wallpapers/default.nix
    ./fonts/default.nix # need to manage fonts in two places becuase life sucks nix sucks
  ];

  home.activation.copyScripts = lib.mkAfter ''
    mkdir -p ~/.scripts
    cp ${./nixos-rebuild.sh} ~/.scripts/
    chmod -R u+w ~/.scripts/
  '';

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # home.packages = with pkgs; [xrandr procps polybar bspwm sxhkd polybar-pulseaudio-control bluez];

  home.sessionVariables = {
    EDITOR = "nvim";
    HOME = "/home/synchronous";
    XDG_CACHE_HOME = "$HOME/.cache";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs;
    [
      # any other "normal" packages go here
    ]
    ++ (
      with lib; let
        # This function extracts the base file name from a path.
        basename = path: lib.lists.last (lib.strings.splitString "/" (toString path));

        # Adjust this path to wherever your scripts are.
        # If your home-manager config is in ~/dotfiles/home.nix,
        # and your scripts are in ~/dotfiles/bin/bin, you could do:
        files = lib.filesystem.listFilesRecursive ./scripts;
      in
        # For each script found, create a derivation installed in $PATH
        lib.lists.forEach files (
          file:
            pkgs.writeScriptBin
            (basename file) # the new package's name
            
            (builtins.readFile file)
        )
    );
}
