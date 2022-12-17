local color = require("../../lua/color")
require("scrollbar").setup({
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "NvimTree",
    "prompt",
    "TelescopePrompt",
    "noice",
  },
})
require("scrollbar.handlers.gitsigns").setup()
require("scrollbar.handlers.search").setup()

vim.cmd("hi ScrollbarHandle guibg=" .. color.scrollbar)
vim.cmd("hi ScrollbarCursorHandle guibg=" .. color.scrollbar)
vim.cmd("hi ScrollbarCursor guibg= " .. color.scrollbar)
vim.cmd("hi ScrollbarGitAdd guibg=" .. color.gitadd)
vim.cmd("hi ScrollbarGitAddHandle guibg=" .. color.gitadd)
vim.cmd("hi ScrollbarGitChange guibg=" .. color.gittext)
vim.cmd("hi ScrollbarGitChangeHandle guibg=" .. color.gittext)
vim.cmd("hi ScrollbarGitDelete guibg=" .. color.gitremove)
vim.cmd("hi ScrollbarGitDeleteHandle guibg=" .. color.gitremove)
