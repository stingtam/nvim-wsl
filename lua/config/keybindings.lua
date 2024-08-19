-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("i", "kj", "<esc>", opts)
vim.keymap.set({"i", "n", "v", "t"}, "<C-q>", "<ESC><cmd>:q!<Enter>", {})

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Terminal
map('n', "<leader>t", ":sp | terminal<CR>", opts)
map('n', "<leader>vt", ":vsp | terminal<CR>", opts)
map('t', "<Esc>", "<C-\\><C-n>", opts)

-- Split window
map("n", "<leader>v", ":vsp<CR>", opts)
map("n", "<leader>h", ":sp<CR>", opts)

