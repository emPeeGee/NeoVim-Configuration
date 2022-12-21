local color = require("color")

require("illuminate").configure({
  providers = {
    "regex",
  },
  delay = 300,
  filetype_overrides = {},
  filetypes_denylist = {
    "fugitive",
    "NvimTree",
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
})

vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = color.word })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = color.word })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = color.word })
