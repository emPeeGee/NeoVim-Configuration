vim.g.mapleader = " "

-- require("neodev").setup()

require("plugins")
require("opt")
require("colorscheme")
require("remap")

if vim.fn.exists("g:neovide") then
  vim.g.neovide_scale_factor = 0.85
  vim.g.neovide_fullscreen = true
end

require("hlslens").setup()
require("nvim-surround").setup({})

-- TODO: ???
local ccc = require("ccc")
ccc.setup({
  highlighter = {
    auto_enable = true,
  },
})

-- TODO: config
require("trouble").setup({
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 8, -- height of the trouble list when position is top or bottom
  icons = true, -- use devicons for filenames
  auto_open = true, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  mode = "loclist",
})

require("better_escape").setup()
require("treesj").setup({ use_default_keymaps = false, max_join_length = 240 })
vim.keymap.set("n", "gJ", ":TSJToggle<CR>")

require("leap").set_default_keymaps()
vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
vim.api.nvim_set_hl(0, "LeapMatch", {
  fg = "white", -- for light themes, set to 'black' or similar
  bold = true,
  nocombine = true,
})
require("leap").opts.highlight_unlabeled_phase_one_targets = true

require("fidget").setup({})
require("luasnip")
require("hlargs").setup()

-- " Enrich go linter
vim.g.go_metalinter_autosave = 1
vim.g.go_metalinter_autosave_enabled = { "golint", "govet" }
-- " Auto imports for go
vim.g.go_fmt_command = "goimports"
-- " Show type in bottom of screen
vim.g.go_auto_type_info = 1

-- automatically update links on read diary
vim.cmd([[augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end ]])

vim.cmd([[hi MatchParen guibg=magenta guifg=white]])
-- require("lsp_signature").setup()
--[[ require('neorg').setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {},
      ["core.norg.journal"] = {},
      ["core.norg.qol.toc"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          }
        }
      }
    }
}]]

-- require("noice").setup({
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true,
--     },
--   },
--   -- you can enable a preset for easier configuration
--   presets = {
--     bottom_search = true, -- use a classic bottom cmdline for search
--     command_palette = true, -- position the cmdline and popupmenu together
--     long_message_to_split = true, -- long messages will be sent to a split
--     inc_rename = false, -- enables an input dialog for inc-rename.nvim
--     lsp_doc_border = false, -- add a border to hover docs and signature help
--   },
-- })

-- require("regexplainer").setup()
-- require("sidebar-nvim").setup({
-- files = {
--    icon = "",
--   show_hidden = false,
--   ignored_paths = {"%.git$"}
--   }
-- })

-- require("lsp_lines").setup()
-- require("drop").setup({
-- theme = "snow", -- can be one of rhe default themes, or a custom theme
--   max = 100, -- maximum number of drops on the screen
-- interval = 150, -- every 150ms we update the drops
-- screensaver = 1000 * 60 * 2, -- show after 5 minutes. Set to false, to disable
--  filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
-- })
--  require("zone").setup()
-- require('mini.indentscope').setup()

-- TODO: LAzy git
