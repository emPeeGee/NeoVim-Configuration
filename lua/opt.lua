print("opts")

--" Disable compatibility with vi which can cause unexpected issues.
vim.opt.swapfile = false

--" Reduce updatetime
vim.opt.updatetime = 300

--" Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
-- vim.opt.completeopt={"longest","menuone"}
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

vim.keymap.set("i", "jj", "<ESC>", { desc = "ESC" })
-- " Avoid mswin.vim making Ctrl-v act as paste
vim.keymap.set("", "<C-V>", "<C-V>", { noremap = true })

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
vim.opt.expandtab = true --" On pressing tab, insert 2 spaces
vim.opt.scrolloff = 15
vim.opt.cmdheight = 2
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true -- Highlight cursor line underneath the cursor horizontally.
vim.opt.cursorcolumn = true -- Highlight cursor line underneath the cursor vertically.

vim.opt.spell = false
vim.opt.list = true
-- set listchars=tab:»·,trail:·

vim.opt.colorcolumn = { 80, 120 }
vim.opt.ruler = false
