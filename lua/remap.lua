-- highlight the visual selection after pressing enter.
vim.cmd(
  [[xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>]]
)
--" If you select some lines then press > to indent the lines, the selection is removed. The indentation can be repeated on the same range using ., but if you still want to retain the visual selection after having pressed > or <, you can use these mappings
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- " Move the line using alt and jk https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set(
  "n",
  "<Leader>ob",
  ":lua print(vim.bo.filetype)<CR>",
  { desc = "Current buffer type" }
)
vim.keymap.set("n", "<leader>ov", [[:e $MYVIMRC<CR>]], { desc = "Open init.vim" })
vim.keymap.set("n", "<leader>oc", [[:source $MYVIMRC<CR>]])
vim.keymap.set("n", "<leader>or", [[:set relativenumber!<Cr>]], { desc = "Set relative number" })
vim.keymap.set("n", "<leader>ou", [[:UndotreeToggle<CR>]], { desc = "Toggle undotree" })
vim.keymap.set("n", "<leader>oi", [[:PlugInstall<CR>]], { desc = "PlugInstall" })
vim.keymap.set("n", "<leader>opc", [[:PlugClean<CR>]], { desc = "PlugClean" })
vim.keymap.set("n", "<leader>ott", [[:Vista!!<cr>]], { desc = "Toggle Vista" })
-- vim.keymap.set('n', '<leader>otc', [[:Vista coc<cr>]] , {desc = 'Toggle Vista coc' })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z")

-- unimpaired
vim.keymap.set("n", "]<Space>", [[:call append(line('.'), '')<CR>]])
vim.keymap.set("n", "[<Space>", [[:call append(line('.')-1, '')<CR>]])
vim.keymap.set("n", "]b", [[:bnext<CR>]])
vim.keymap.set("n", "[b", [[:bprev<CR>]])
vim.keymap.set("n", "[B", ":Bdelete<CR>", { desc = "Bdelete", silent = true })
-- <C-o> reoped last buff
