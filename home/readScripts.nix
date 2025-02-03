# readScripts.nix
# {lib, ...}: let
  # readScriptsRecursively = dir: let
    # entries = builtins.readDir dir;
    # names = builtins.attrNames entries;
  # in
    # lib.concatMap (
      # entry: let
        # fullPath = "${dir}/${entry}";
        # entryInfo = entries.${entry};
      # in
        # entryInfo
      # # if entryInfo.type == "directory"
      # # then
      # # # Recursively gather more {name, value} items
      # # readScriptsRecursively fullPath
      # # else
      # # [
      # # {
      # # name = entry;
      # # value = fullPath;
      # # }
      # # ]
    # );
# in
  # # Return just the function for now, so you can test it easily
  # {
    # inherit readScriptsRecursively;
  # }
