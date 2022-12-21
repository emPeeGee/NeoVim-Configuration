-- Right now, auto close of tree on last buffer doesn't work.
-- Solution. Nvim-tree team said it is not posible
-- https://github.com/nvim-tree/nvim-tree.lua/issues/1368

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_setup = false,
  -- open_on_setup_file = true,
  view = {
    adaptive_size = true,
    mappings = {},
  },
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
  },
  renderer = {
    indent_width = 1,
    group_empty = true,
    highlight_git = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>nm", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>nn", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file tree" })

-- *nvim-tree.hijack_cursor* ???
