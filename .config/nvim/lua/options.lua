local options = {
  -- Enable true colors support. Important for the color scheme.
  termguicolors = true,

  -- Always show tabs
  showtabline = 2,

  -- Convert tabs to spaces
  expandtab = true,

  -- The number of spaces for each indentation
  shiftwidth = 2,

  --Set highlight on search
  hlsearch = true,

  --Make line numbers default
  number = true,

  --Enable mouse mode
  mouse = 'a',

  --Enable break indent
  breakindent = true,

  --Save undo history
  undofile = true,

  --Case insensitive searching UNLESS /C or capital in search
  ignorecase = true,
  smartcase = true,

  --Decrease update time
  updatetime = 250,
  signcolumn = 'yes',

  -- Set completeopt to have a better completion experience
  completeopt = 'menuone,noselect',

  -- Doesn't show current mode, e.g. -- INSERT --.
  showmode = false,

}

for k, v in pairs(options) do
  vim.opt[k] = v
end
