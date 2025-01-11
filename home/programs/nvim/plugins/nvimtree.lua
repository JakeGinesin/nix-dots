vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

require('nvim-tree').setup()

require('nvim-tree').setup({
  on_attack = my_on_attach,
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = false,
    -- mappings = {
      -- list = {
        -- { key = 'u', action = 'dir_up' },
      -- },
    -- },
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    exclude = {".git", ".jpg", ".mp4", ".ogg", ".iso", ".pdf", ".odt", ".png", ".gif", ".db", ".class"},
  },
  actions = {
    open_file = {
        resize_window = false
    }
  },
})
