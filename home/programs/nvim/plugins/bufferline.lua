-- Ensure bufferline configuration exists
local bufferline = vim.g.bufferline or {}

-- Enable/disable animations
bufferline.animation = true

-- Enable/disable auto-hiding the tab bar when there is a single buffer
-- bufferline.auto_hide = false

-- Enable/disable current/total tabpages indicator (top right corner)
bufferline.tabpages = true

-- Enable/disable close button
bufferline.closable = true

-- Enable/disable clickable tabs
--  - left-click: go to buffer
--  - middle-click: delete buffer
bufferline.clickable = true

-- Exclude buffers from the tabline
-- bufferline.exclude_ft = { 'javascript' }
-- bufferline.exclude_name = { 'package.json' }

-- Enable/disable icons
-- Options: 'buffer_number', 'numbers', 'both', 'buffer_number_with_icon'
bufferline.icons = true

-- Use nvim-web-devicons colors if false
bufferline.icon_custom_colors = false

-- Configure icons on the bufferline
bufferline.icon_separator_active = '▎'
bufferline.icon_separator_inactive = '▎'
bufferline.icon_close_tab = ''
bufferline.icon_close_tab_modified = '●'
bufferline.icon_pinned = '車'

-- Configure buffer insertion position
bufferline.insert_at_start = false
bufferline.insert_at_end = false

-- Set maximum padding width
bufferline.maximum_padding = 4

-- Set maximum buffer name length
bufferline.maximum_length = 30

-- Enable semantic letters for buffer-pick mode
bufferline.semantic_letters = true

-- Define buffer letters order for buffer-pick mode
bufferline.letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

-- Set name for unnamed buffers
bufferline.no_name_title = nil

-- Mappings
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true })
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', { silent = true })
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true })
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { silent = true })
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', { silent = true })
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', { silent = true })
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', { silent = true })
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', { silent = true })
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { silent = true })

