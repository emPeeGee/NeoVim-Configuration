

-- Enable type file detection. Vim will be able to try to detect the type of file is use.
--

vim.cmd [[
  let mapleader = "\<Space>"
  let g:mapleader="\<Space>"
]]

vim.g.mapleader = "<Space>"
vim.opt.completeopt = {'longest', 'menuone'}
vim.opt.mouse:append('a')
vim.opt.compatible = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


-- set completeopt=longest,menuone
