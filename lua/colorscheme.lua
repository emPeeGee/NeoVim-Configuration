local color = require("color")

require("gruvbox").setup({
  contrast = "soft",
})

local function set_horizon()
  vim.cmd([[colorscheme horizon]])
  vim.cmd([[highlight! link SignColumn LineNr]])
  require("lualine").setup({ options = { theme = "horizon" } })
end

local function set_dark_theme()
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])
  vim.cmd([[highlight! link SignColumn LineNr]])

  -- INFO: Issues when migrating to init.lua and packer.nvim.
  -- I've had to explicitly set load order in packer.nvim carefully as gruvbox clears out set highlights
  vim.api.nvim_set_hl(0, "SpellBad", { fg = "magenta", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellCap", { fg = "cyan", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellRare", { fg = "cyan", sp = "red" })
  vim.api.nvim_set_hl(0, "SpellLocal", { fg = "cyan", sp = "red" })

  require("lualine").setup({ options = { theme = "gruvbox-material" } })
end

vim.cmd([[syn match myExCapitalWords /#([A-Fa-f0-9]{3}){1,2}/ contains=@NoSpell]]) -- sth not working
-- TODO: ignore numbers and hex colors [CSSF] #2E3422

local function set_light_theme()
  vim.cmd([[set background=light]])
  vim.cmd([[colorscheme solarized8_high]])
  vim.cmd([[colo solarized8_high]])
  vim.cmd([[highlight! link SignColumn LineNr]])
  vim.cmd([[hi LineNr guibg=NONE]])
  require("lualine").setup({ options = { theme = "gruvbox_light" } })
end

local function set_minischeme()
  local MiniBase16 = require("mini.base16")
  require("mini.base16").setup({
    palette = MiniBase16.mini_palette("#e2e5ca", "#002a83", 75),
    use_cterm = true,
    plugins = { default = true },
  })
end

set_dark_theme()

--Theme toggle
vim.keymap.set("n", "<leader>ol", set_light_theme, { desc = "Set light theme" })
vim.keymap.set("n", "<leader>od", set_dark_theme, { desc = "Set dark theme" })
vim.keymap.set("n", "<leader>oq", set_horizon, { desc = "Set horizon theme" })
vim.keymap.set("n", "<leader>o'", set_minischeme, { desc = "Set mini scheme theme" })
