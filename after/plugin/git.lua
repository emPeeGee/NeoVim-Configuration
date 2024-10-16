local color = require("color")
local wk = require("which-key")

wk.register({
  g = { name = "+git" },
}, { prefix = "<leader>" })

require("neogit").setup({})



-- disable the default highlight group
vim.g.conflict_marker_highlight_group = ""

-- Include text after begin and end markers
vim.g.conflict_marker_begin = "^<<<<<<< .*$"
vim.g.conflict_marker_end = "^>>>>>>> .*$"

vim.cmd("highlight ConflictMarkerBegin guibg=" .. color.gitbegin)
vim.cmd("highlight ConflictMarkerOurs guibg=" .. color.gitadd)
vim.cmd("highlight ConflictMarkerTheirs guibg=" .. color.gitchange)
vim.cmd("highlight ConflictMarkerEnd guibg=" .. color.gitend)
vim.cmd("highlight ConflictMarkerCommonAncestorsHunk guibg=" .. color.gittext)

-- vim.cmd("hi DiffAdd gui=none guifg=NONE guibg=" .. color.gitadd)
vim.cmd("hi DiffChange gui=none guifg=NONE guibg=" .. color.gitchange)
vim.cmd("hi DiffText gui=none guifg=NONE guibg=" .. color.gitend)
vim.cmd("hi DiffDelete gui=none guifg=NONE guibg=" .. color.gitremove)
vim.cmd("hi DiffviewDiffAddAsDelete gui=none guifg=NONE guibg=" .. color.gitremove)

vim.cmd([[hi  link GitSignsCurrentLineBlame Comment]])
vim.cmd("hi GitSignsChangeInline gui=none guifg=NONE guibg=" .. color.gittext)
vim.cmd("hi GitSignsAddInline gui=none guifg=NONE guibg=" .. color.gittext)
vim.cmd("hi GitSignsDeleteInline gui=none guifg=NONE guibg=" .. color.gittext)

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { noremap = true, desc = "Neogit" })
vim.keymap.set("n", "<leader>gm", "<cmd>Gdiffsplit!<cr>", { noremap = true, desc = "Gdiffsplit" })
vim.keymap.set("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line{}<CR>')
vim.keymap.set(
  "n",
  "<leader>go",
  "<cmd>DiffviewOpen<CR>",
  { noremap = true, desc = "Diffview open" }
)
vim.keymap.set(
  "n",
  "<leader>gc",
  "<cmd>DiffviewClose<CR>",
  { noremap = true, desc = "Diffview close" }
)
vim.keymap.set(
  "n",
  "<leader>gl",
  "<cmd>DiffviewFileHistory<CR>",
  { noremap = true, desc = "Git Log" }
)
vim.keymap.set(
  "n",
  "<leader>gf",
  "<cmd>DiffviewFileHistory %<CR>",
  { noremap = true, desc = "Git File History" }
)
