require("todo-comments").setup({})

vim.keymap.set(
  "n",
  "<leader>tl",
  "<cmd>TodoLocList<cr>",
  { desc = "Toggle Todo list" }
)
vim.keymap.set(
  "n",
  "<leader>tq",
  "<cmd>TodoQuickFix<cr>",
  { desc = "Toggle quick fix list" }
)
vim.keymap.set(
  "n",
  "<leader>tt",
  "<cmd>TodoTelescope<cr>",
  { desc = "Toggle Todo telescope" }
)
