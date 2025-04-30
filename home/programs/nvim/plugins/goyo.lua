local opts = { noremap = true, silent = true }

-- "Focus" commands that rely on the Goyo plugin
vim.api.nvim_set_keymap("n", "<C-a>z", ":Goyo 80<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-a>q", ":Goyo!<CR>", opts)

-- automatically resize goyo when nvim resizes
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        if vim.fn.exists('#goyo') == 1 then
            vim.cmd("normal <C-w>=")
        end
    end,
})

vim.api.nvim_create_autocmd('User', {
  group = grp,
  pattern = 'GoyoEnter',
  callback = function()
    lualine.hide({ place = {'statusline', 'winbar', 'tabline'} })
  end,
})

vim.api.nvim_create_autocmd('User', {
  group = grp,
  pattern = 'GoyoLeave',
  callback = function()
    lualine.hide({ place = {'statusline', 'winbar', 'tabline'}, unhide = true })
  end,
})
