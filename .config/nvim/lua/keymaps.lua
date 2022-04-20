local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Space as leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Save with Ctrl + s
keymap("n", "<C-s>", ":w<CR>", opts)

-- Save and reload nvim
keymap("n", "<C-r>", ":w<CR>:so %<CR>", opts)

-- Quit nvim
keymap("n", "<C-c>", ":q<CR>", opts)

-- Switch buffers (needs nvim-bufferline)
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)

-- Close current buffer
keymap("n", "<C-w>", ":bd<CR>", opts)

-- Pick and close a buffer
keymap("n", "<C-p>", ":BufferLinePickClose<CR>", opts)

-- File explorer
keymap("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)

-- Fuzzy Finder
keymap("n", "ff", ":Telescope find_files<CR>", opts)
