-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- TODO: Right now, auto close of tree on last buffer doesn't work,
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {},
  },
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set(
  "n",
  "<leader>nm",
  "<cmd>NvimTreeFindFileToggle<CR>",
  { desc = "Toggle file tree" }
)
vim.keymap.set(
  "n",
  "<leader>nn",
  "<cmd>NvimTreeFocus<cr>",
  { desc = "Focus file tree" }
)
