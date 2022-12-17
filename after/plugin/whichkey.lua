-- " Open whichkey after 500ms
vim.opt.timeoutlen = 500

require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true,
    },
  },
})
