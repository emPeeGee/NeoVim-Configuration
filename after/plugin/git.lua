local color = require("color")
local wk = require("which-key")

wk.register({
  g = { name = "+git" },
}, { prefix = "<leader>" })

require("diffview").setup({
  enhanced_diff_hl = true,
})

require("gitsigns").setup({
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true, -- color is ...
  sign_priority = 10,
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map("n", "]d", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
    map("n", "[d", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

    -- Actions
    map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
    map("v", "<leader>gs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
    map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
    map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
    -- map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    -- map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map("n", "<leader>gv", "<cmd>Gitsigns toggle_deleted<CR>")
    map("n", "<leader>gB", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
  end,
})

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

vim.cmd("hi DiffAdd gui=none guifg=NONE guibg=" .. color.gitadd)
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
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { noremap = true, desc = "Git blame" })
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
