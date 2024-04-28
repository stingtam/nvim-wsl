vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = true
-- clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.o.incsearch = true
vim.o.autoread = true
vim.bo.autoread = true
vim.wo.wrap = false
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.wildmenu = true
vim.o.showtabline = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.hidden = true
vim.o.timeoutlen = 500
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- set python path
vim.g.python3_host_prog = 'D:/Anaconda/python'
