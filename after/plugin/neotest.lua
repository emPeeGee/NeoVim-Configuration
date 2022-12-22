require("neotest").setup({
  adapters = {
    -- require('neotest-go'),
  },
})

-- require("coverage").setup({
--   lang = {
--     javascript = {
--       coverage_file = "packages/delivery/coverage/lcov.info",
--     },
--   },
-- })

vim.keymap.set(
  "n",
  "<leader>rr",
  '<cmd>lua require("neotest").run.run()<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set(
  "n",
  "<leader>rf",
  '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set(
  "n",
  "<leader>rl",
  '<cmd>lua require("neotest").run.run_last()<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set(
  "n",
  "<leader>rx",
  '<cmd>lua require("neotest").run.stop()<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set(
  "n",
  "<leader>rs",
  '<cmd>lua require("neotest").summary.toggle()<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set(
  "n",
  "<silent>[n",
  '<cmd>lua require("neotest").jump.prev()<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set(
  "n",
  "<silent>]n",
  '<cmd>lua require("neotest").jump.next()<CR>',
  { noremap = true, desc = "" }
)
vim.keymap.set("n", "<leader>tc", ":CoverageToggle<CR>", { noremap = true, desc = "" })
