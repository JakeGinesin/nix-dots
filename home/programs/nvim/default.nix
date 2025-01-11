# ref: https://github.com/vimjoyer/nvim-nix-video/blob/main/home.nix
{
  pkgs,
  lib,
  ...
}: {
  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
    '';

    extraPackages = with pkgs; [
      lua-language-server
      # rnix-lsp

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline-themes
      # coc-nvim
      {
        plugin = goyo-vim;
        config = toLuaFile ./plugins/goyo.lua;
      }
      {
        plugin = tokyonight-nvim;
        config = toLuaFile ./plugins/tokyonight.lua;
      }
      {
        plugin = nerdcommenter;
        config = toLuaFile ./plugins/nerdcommenter.lua;
      }
      {
        plugin = nvim-tree-lua;
        config = toLuaFile ./plugins/nvimtree.lua;
      }
      {
        plugin = vim-airline;
        config = toLuaFile ./plugins/airline.lua;
      }
      {
        plugin = barbar-nvim;
        config = toLuaFile ./plugins/bufferline.lua;
      }
    ];

    # extraConfig = lib.fileContents ./init.vim;
  };
}
