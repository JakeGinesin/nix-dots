require('smear_cursor').setup({
  -- Main options
  stiffness = 0.4,                    -- [0, 1] - cursor follow speed
  trailing_stiffness = 0.45,          -- [0, 1] - trail follow speed
  distance_stop_animating = 0.1,      -- stop when close enough
  
  -- Insert mode
  smear_insert_mode = true,
  stiffness_insert_mode = 0.5,
  trailing_stiffness_insert_mode = 0.5,
  
  -- Visual tweaks
  cursor_color = "#d3cdc3",           -- match your cursor color
  legacy_computing_symbols_support = false,
  
  -- Optional
  smear_between_buffers = true,
  smear_between_neighbor_lines = true,
})
