local opts = { noremap = true, silent = true }

-- "Focus" commands that rely on the Goyo plugin
vim.api.nvim_set_keymap("n", "<C-a>z", ":Goyo 80<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-a>q", ":Goyo!<CR>", opts)
