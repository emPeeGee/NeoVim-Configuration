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
    "commonlisp",
    "markdown"
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
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["]w"] = "@parameter.inner",
      },
      swap_previous = {
        ["[w"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist

      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]v"] = "@class.outer",
        -- ["]c"] = {query = "@class.outer", desc = "Example"},
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]V"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[v"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[V"] = "@class.outer",
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnn",
      scope_incremental = "gnc",
      node_decremental = "gnm",
    },
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

-- require("spellsitter").setup({
--   enable = true,
-- })

-- FIX:  Why where are commands like [m ]m [f ]f but :map doesn't know about them. Treesitter docs
