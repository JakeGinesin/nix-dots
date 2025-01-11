-- Set airline theme
vim.g.airline_theme = 'simple'

-- Initialize airline symbols if not already defined
vim.g.airline_symbols = vim.g.airline_symbols or {}

-- Configure airline symbols
vim.g.airline_symbols.crypt = '🔒'
vim.g.airline_symbols.linenr = '☰'
vim.g.airline_symbols.maxlinenr = ''
vim.g.airline_symbols.paste = 'ρ'
vim.g.airline_symbols.spell = 'Ꞩ'
vim.g.airline_symbols.notexists = 'Ɇ'
vim.g.airline_symbols.whitespace = 'Ξ'

-- Powerline symbols (requires appropriate fonts)
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
vim.g.airline_symbols.branch = ''
vim.g.airline_symbols.linenr = '☰ '

-- Configure bufferline extension
-- vim.g.airline#extensions#tabline#enabled = 1
vim.g.airline_extensions_tabline_formatter = 'unique_tail'

-- Set global statusline
vim.opt.laststatus = 3

