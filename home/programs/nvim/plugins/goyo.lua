local opts = { noremap = true, silent = true }

-- "Focus" commands that rely on the Goyo plugin
vim.api.nvim_set_keymap("n", "<C-a>z", ":Goyo 80<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-a>q", ":Goyo!<CR>", opts)

-- https://github.com/junegunn/goyo.vim/issues/180
-- automatically resize goyo when nvim resizes
vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        if vim.t.goyo_master == 1 then
            vim.cmd([[exe "normal \<c-w>="]])
        end
    end,
})

-- vim.api.nvim_create_autocmd("VimResized", {
    -- callback = function()
        -- if vim.fn.exists('#goyo') == 1 then
            -- vim.cmd("normal <C-w>=")
        -- end
    -- end,
-- })

-- hide and unhide lualine when entering and leaving goyo

local lualine = require('lualine')
local grp = vim.api.nvim_create_augroup('goyo_lualine_toggle', { clear = true })

local function hide() lualine.hide{ place = {'statusline', 'winbar', 'tabline'} } end
local function unhide() lualine.hide{ place = {'statusline', 'winbar', 'tabline'}, unhide = true } end


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

vim.api.nvim_create_autocmd('VimEnter', {
  group = grp,
  once  = true,
  callback = function()
    local w = vim.g.goyo_if
    if w then
      vim.schedule(hide)
    end
  end,
})

vim.api.nvim_create_autocmd('UIEnter', {
  once  = true,
  group = grp,
  callback = function()
    local w = vim.g.goyo_if
    if w then
      vim.opt.showtabline = 0
      vim.cmd('BarbarDisable')
    end
  end,
})
