require("telescope").setup({
  pickers = {
    find_files = {
      theme = "ivy",
      border = false,
      layout_config = {
        height = 15,
        width = vim.o.columns,
        preview_width = 0,
        prompt_position = "bottom",
      },
    },
  },
  defaults = {
    border = true,
    live_grep = {
      debounce = 250,
    },
    file_ignore_patterns = {
      "_build",
      "__localization__",
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        preview_height = 0.6,
      },
      height = vim.o.lines,
      width = vim.o.columns,
    },
  },
})

require("project_nvim").setup({
  detection_methods = { "patters" },
})

require("telescope").load_extension("projects")

-- require('telescope').load_extension('coc')
vim.keymap.set(
  "n",
  "<leader><leader>",
  "<cmd>Telescope find_files<cr>",
  { desc = "" }
)
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "" })
vim.keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { desc = "" }
)
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "" })
vim.keymap.set(
  "n",
  "<leader>fv",
  "<cmd>Telescope grep_string<cr>",
  { desc = "" }
)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "" })
vim.keymap.set(
  "n",
  "<leader>fg",
  "<cmd>Telescope git_status<cr>",
  { desc = "" }
)
-- vim.keymap.set('n', '<leader>fc', '<cmd>Telescope coc<cr>', { desc = ''})
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "" })
