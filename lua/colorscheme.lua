local color = require("color")

function set_horizon()
  vim.cmd([[colorscheme horizon]])
  vim.cmd([[highlight! link SignColumn LineNr]])
  require("lualine").setup({ options = { theme = "horizon" } })
end

function set_dark_theme()
  vim.g.gruvbox_contrast_dark = "soft"
  vim.cmd([[set background=dark]])
  vim.cmd([[colorscheme gruvbox]])
  vim.cmd([[highlight! link SignColumn LineNr]])
  require("lualine").setup({ options = { theme = "gruvbox-material" } })
end

function set_light_theme()
  vim.cmd([[set background=light]])
  vim.cmd([[colorscheme solarized8_high]])
  vim.cmd([[colo solarized8_high]])
  vim.cmd([[highlight! link SignColumn LineNr]])
  vim.cmd([[hi LineNr guibg=NONE]])
  require("lualine").setup({ options = { theme = "gruvbox_light" } })
end

function set_minischeme()
  local MiniBase16 = require("mini.base16")
  require("mini.base16").setup({
    palette = MiniBase16.mini_palette("#e2e5ca", "#002a83", 75),
    use_cterm = true,
    plugins = { default = true },
  })
end

set_dark_theme()

--Theme toggler
vim.keymap.set("n", "<leader>ol", set_light_theme, { desc = "Set light theme" })
vim.keymap.set("n", "<leader>od", set_dark_theme, { desc = "Set dark theme" })
vim.keymap.set("n", "<leader>oq", set_horizon, { desc = "Set horizon theme" })
vim.keymap.set("n", "<leader>o'", set_minischeme, { desc = "Set minsheme theme" })
