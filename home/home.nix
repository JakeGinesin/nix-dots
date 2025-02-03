{
  config,
  pkgs,
  lib,
  ...
}: let
  # 1) Recursively collect all scripts into a *list* of { name, value } items
  # readScriptsRecursively = dir: let
  # entries = builtins.readDir dir;
  # names = builtins.attrNames entries;
  # in
  # lib.concatMap (
  # entry: let
  # fullPath = "${dir}/${entry}";
  # entryInfo = entries.${entry};
  # in
  # if entryInfo.type == "directory"
  # then
  # # Recursively gather more {name, value} items
  # readScriptsRecursively fullPath
  # else
  # # For each file, produce one record
  # [
  # {
  # name = entry;
  # value = fullPath;
  # }
  # ]
  # )
  # names;
  # # 2) Convert that list of {name, value} into an attribute set
  # scripts = lib.attrsets.listToAttrs (readScriptsRecursively ./scripts);
  # # 3) Map over the attrset to create shell applications
  # scriptDerivations =
  # lib.attrsets.mapAttrs
  # (scriptName: scriptPath:
  # pkgs.writeShellApplication {
  # name = scriptName;
  # runtimeInputs = with pkgs; [
  # # put your dependencies here
  # netcat
  # ];
  # text = builtins.readFile scriptPath;
  # })
  # scripts;
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
}
