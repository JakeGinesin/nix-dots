require('nvim-treesitter.configs').setup {
  ensure_installed = {},
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,                -- keep TS for everything else
    disable = { "markdown", "markdown_inline" },
    additional_vim_regex_highlighting = false,
  },
  indent                = { enable = false },
  incremental_selection = { enable = false },
})
