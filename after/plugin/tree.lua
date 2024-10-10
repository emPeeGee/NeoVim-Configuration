-- Right now, auto close of tree on last buffer doesn't work.
-- Solution. Nvim-tree team said it is not posible
-- https://github.com/nvim-tree/nvim-tree.lua/issues/1368

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  -- open_on_setup = true,
  -- open_on_setup_file = true,
  view = {
    adaptive_size = true,
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
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>nm", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>nn", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file tree" })

local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- *nvim-tree.hijack_cursor* ???
