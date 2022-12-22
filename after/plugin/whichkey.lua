-- Open whichkey after 500ms
vim.opt.timeoutlen = 500

require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true,
    },
  },
})

local variable_vad_name_veri = 1
print(variable_vad_name_veri)
-- FIX: Why [S ]S are not included in whichkey ?
