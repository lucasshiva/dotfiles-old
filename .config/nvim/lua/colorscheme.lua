-- Change/modify theme.
vim.g.tokyonight_style = "night"    
vim.g.tokyonight_colors = {
  bg = "#080808"
}

-- Set colorscheme
vim.cmd [[colorscheme tokyonight]]

-- Apply colorscheme to plugins that support it.
require("lualine").setup {
  options = { theme = "tokyonight" } 
}
