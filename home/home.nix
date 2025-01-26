{
  config,
  pkgs,
  lib,
  ...
}: let
  # readScriptsRecursively = dir: let
  # entries = builtins.readDir dir; # This gives an attrset of filenames -> { "type": "regular"|"directory", ...}
  # names = builtins.attrNames entries;
  # in
  # # We convert all items to a list of name/value pairs; then flatten them
  # lib.attrsets.listToAttrs (lib.concatMap (
  # entry: let
  # fullPath = "${dir}/${entry}";
  # entryInfo = entries.${entry}; # e.g., {type="regular"|"directory",size=...}
  # in
  # if entryInfo.type == "directory"
  # then
  # # Recursively read sub-directory
  # builtins.attrValues (readScriptsRecursively fullPath)
  # else
  # # For a file, produce an attribute set item
  # [
  # {
  # name = entry;
  # value = fullPath;
  # }
  # ]
  # )
  # names);
  # scripts = readScriptsRecursively ./scripts;
  # scriptDerivations =
  # lib.attrsets.mapAttrs (
  # scriptName: scriptPath:
  # pkgs.writeShellApplication {
  # name = scriptName;
  # # Pick whatever runtime dependencies you need
  # runtimeInputs = with pkgs; [
  # # Example: netcat, bashInteractive, curl, etc.
  # netcat
  # ];
  # # The text of the shell script is read directly from the file
  # text = builtins.readFile scriptPath;
  # }
  # )
  # scripts;
in {
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
}
