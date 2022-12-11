---@diagnostic disable: undefined-global
print("config")


require('plugins')
require('opt')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require'gitsigns'.setup{
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true, -- color is ...
  sign_priority = 10,
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>hv', '<cmd>Gitsigns toggle_deleted<CR>')
    map('n', '<leader>hB', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
  end
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "rust", "javascript", "typescript", "scss",   "yaml", "tsx", "regex", "json", "html", "go", "css", "comment", "elixir", "norg", "http", "haskell", "regex" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },
  playground = {
    enabled = true
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Treesitter context
require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    default = {
      'class',
      'function',
      'method',
      'for', 
      'while',
      'if',
      'switch',
      'case',
    },
  },
}

require('telescope').setup{
  defaults = {
    live_grep = {
      debounce = 250,
    },
    file_ignore_patterns = {
      "_build",
      "__localization__"
    },
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.9,
      height = 0.9
    }
  },
}


require('telescope').load_extension('coc')
-- " require"telescope".load_extension("frecency")
--

require('spellsitter').setup({
  enable = true,
})

require('hlslens').setup()

require("neotest").setup({
  adapters = {
    -- require('neotest-go'),
  }
})
-- require('leap').set_default_keymaps()
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

require("todo-comments").setup{}

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Right now, auto close of tree on last buffer doesn't work,
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = { },
  },
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  },
  filters = {
    dotfiles = true,
  },
})

require('which-key').setup({
  plugins = {
    spelling = {
      enabled = true
    }
  }
})


-- " Telescope
-- " Keybindings
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
-- " vim.keumap.set('n', 'leader>fr <cmd>Telescope frecency workspace=CWD<cr>
-- " vim.keumap.set('n', 'leader>fe <cmd>Telescope frecency<cr>
vim.keymap.set('n', '<leader>fv', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_status<cr>')
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope coc<cr>')

-- " require("noice").setup()
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

require("bufferline").setup{
options = {
  diagnostics = "coc",
  actions = {
    open_file = {
      quit_on_open = true
      }
    }
  },
}

require('lualine').setup({
  options = { globalstatus = true },
  extensions = {'nvim-tree'},
  sections = { lualine_x = { 'filesize' } }
})

require('mini.starter').setup()

local map = require('mini.map')
map.setup({
 symbols = {
   encode = map.gen_encode_symbols.shade('1x2'),
 },
integrations = {
  map.gen_integration.builtin_search(),
  map.gen_integration.gitsigns(),
  map.gen_integration.diagnostic(),
  },
window = {
  width = 12
  },
})

vim.keymap.set('n', '<Leader>mf', MiniMap.toggle_focus)
vim.keymap.set('n', '<Leader>mr', MiniMap.refresh)
vim.keymap.set('n', '<Leader>ms', MiniMap.toggle_side)
vim.keymap.set('n', '<Leader>mm', MiniMap.toggle)


require('regexplainer').setup()
require("coverage").setup({
lang = {
  javascript = {
    coverage_file = 'packages/delivery/coverage/lcov.info'
    }
  }
})
require('regexplainer').setup()

-- require("sidebar-nvim").setup({
-- files = {
--    icon = "",
--   show_hidden = false,
--   ignored_paths = {"%.git$"}
--   }
-- })

require("diffview").setup({
  enhanced_diff_hl = true,
})


-- default configuration
require('illuminate').configure({
    providers = {
        'regex',
    },
    delay = 300,
    filetype_overrides = {},
    filetypes_denylist = {
        'fugitive',
        'NvimTree'
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
--  :lua print(vim.bo.filetype); Get file type of current file

require("scrollbar").setup()
require("scrollbar.handlers.gitsigns").setup()
require("scrollbar.handlers.search").setup()
require("better_escape").setup()

require("lsp_lines").setup()

require('treesj').setup()
vim.keymap.set('n', 'gJ', ":TSJToggle<CR>")

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}



-- require("drop").setup({
  -- theme = "snow", -- can be one of rhe default themes, or a custom theme
--   max = 100, -- maximum number of drops on the screen
  -- interval = 150, -- every 150ms we update the drops
  -- screensaver = 1000 * 60 * 2, -- show after 5 minutes. Set to false, to disable
 --  filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
-- })
--  require("zone").setup()

