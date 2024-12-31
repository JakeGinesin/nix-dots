{
  builtins,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
  };

  programs.alacritty.settings = lib.trivial.importTOML ./alacritty.toml;
}
