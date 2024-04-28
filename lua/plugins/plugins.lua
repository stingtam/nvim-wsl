local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
    require('plugins.colorscheme'),
    require('plugins.ui'),
    require('plugins.autopairs'),
    require('plugins.telescope'),
    require('plugins.treesitter'),
    require('plugins.tabout'),
    require('plugins.comment'),
    require('plugins.utils'),
    require('plugins.lsp'),
    require('plugins.cmp'),
})
