local color = require("color")

require("gruvbox").setup({
  contrast = "soft",
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
})

local function set_dark_theme()
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])
  vim.cmd([[highlight! link SignColumn LineNr]])

  vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = color.word })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = color.word })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = color.word })

  -- INFO: Issues when migrating to init.lua and packer.nvim.
  -- I've had to explicitly set load order in packer.nvim carefully as gruvbox clears out set highlights
  vim.api.nvim_set_hl(0, "SpellBad", { fg = "magenta", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellCap", { fg = "cyan", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellRare", { fg = "cyan", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellLocal", { fg = "cyan", sp = "red" })

  require("lualine").setup({ options = { theme = "gruvbox-material" } })
end

vim.cmd([[syn match myExCapitalWords /#([A-Fa-f0-9]{3}){1,2}/ contains=@NoSpell]]) -- sth not working
-- TODO: ignore numbers and hex colors [CSSF] "#2E3422"

local function set_light_theme()
  vim.o.background = "light" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])
  vim.cmd([[set background=light]])
  vim.cmd([[highlight! link SignColumn LineNr]])

  vim.api.nvim_set_hl(0, "SpellBad", { fg = "magenta", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellCap", { fg = "cyan", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellRare", { fg = "cyan", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellLocal", { fg = "cyan", sp = "red" })

  vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = color.word_light })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = color.word_light })
  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = color.word_light })
  -- vim.cmd([[hi LineNr guibg=NONE]])
  require("lualine").setup({ options = { theme = "gruvbox_light" } })
end

set_dark_theme()

--Theme toggle
vim.keymap.set("n", "<leader>ol", set_light_theme, { desc = "Set light theme" })
vim.keymap.set("n", "<leader>od", set_dark_theme, { desc = "Set dark theme" })
