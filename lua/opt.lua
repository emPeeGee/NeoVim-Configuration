vim.opt.termguicolors = true

vim.opt.swapfile = false -- Disable compatibility with vi which can cause unexpected issues.

vim.opt.undofile = true -- Save undo history

vim.opt.updatetime = 30 -- Reduce updatetime

vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- vim.opt.completeopt={"longest","menuone"}

vim.opt.backup = false
vim.opt.writebackup = false

vim.keymap.set("i", "jj", "<ESC>", { desc = "ESC" })
vim.keymap.set("", "<C-V>", "<C-V>", { noremap = true }) -- Make Ctrl-v act as paste

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 2
vim.opt.foldnestmax = 10
vim.opt.foldenable = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.wrap = true

vim.opt.tabstop = 2 -- show existing tab with 2 spaces width
vim.opt.shiftwidth = 2 -- when indenting with '>', use 2 spaces width
vim.opt.expandtab = true -- On pressing tab, insert 2 spaces
vim.opt.scrolloff = 15
vim.opt.cmdheight = 2
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true -- Highlight cursor line underneath the cursor horizontally.
vim.opt.cursorcolumn = true -- Highlight cursor line underneath the cursor vertically.

vim.opt.colorcolumn = { 80, 100, 120 }
vim.opt.ruler = false

-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.opt.guicursor =
  [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

-- FIX: incorrect variable names will be ignored. Create issue for neovim
vim.opt.spell = true -- [s ]s zg z=
vim.opt.spelllang = { "en" }
vim.opt.spelloptions = "camel"
