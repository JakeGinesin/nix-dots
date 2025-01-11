-- Tokyonight configuration in Lua

require("tokyonight").setup({
  -- use the night style
  style = "night",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.bg = "#ff0000"
    colors.fg = "#e3e1e1"
  end
})


-- vim.g.tokyonight_style = "day"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- vim.g.tokyonight_colors = {
--   bg_dark = "#ff0000",
--   bg      = "#0d0d0d",
--   fg      = "#e3e1e1",
-- }
