require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "help",
    "lua",
    "rust",
    "javascript",
    "typescript",
    "scss",
    "yaml",
    "tsx",
    "regex",
    "json",
    "html",
    "go",
    "css",
    "comment",
    "elixir",
    "norg",
    "http",
    "haskell",
    "regex",
    "vim",
  },
  sync_install = false,
  playground = {
    enabled = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})

-- Treesitter context
require("treesitter-context").setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
  },
})

require("spellsitter").setup({
  enable = true,
})
