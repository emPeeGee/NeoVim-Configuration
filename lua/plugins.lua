local color = require("color")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
      vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
-- require("lazy").setup({
--   spec = {
--     -- import your plugins
--     -- { import = "morhetz/gruvbox" },
--   },
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   -- automatically check for plugin updates
-- })

require("lazy").setup({
  -- checker = { enabled = true },
  -- install = { colorscheme = { "morhetz/gruvbox" } },
  -- spec = {
  -- import your plugins
  -- { import = "plugins" },
  -- { import = "morhetz/gruvbox" },
  -- },
  checker = { enabled = true },
  -- spec = {
  --   import your plugins
  -- { import = "morhetz/gruvbox" },
  -- },
  -- { "morhetz/gruvbox",                 lazy = false },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      terminal_colors = true, -- add neovim terminal colors
    }
  },
  "lifepillar/vim-solarized8",
  "ryanoasis/vim-devicons",
  "nvim-lua/plenary.nvim",
  -- use 'fannheyward/telescope-coc.nvim'
  "nvim-telescope/telescope-symbols.nvim",
  --  " IDEA: Then exploring new file, get outline an see the file
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signcolumn = true,         -- Toggle with `:Gitsigns toggle_signs`
        numhl = true,              -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,            -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false,         -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true, -- color is ...
        sign_priority = 10,
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end

          -- Navigation
          map("n", "]d", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
          map("n", "[d", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

          -- Actions
          map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
          map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
          map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
          map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
          map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
          map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
          map("n", "<leader>hv", "<cmd>Gitsigns toggle_deleted<CR>")
          map("n", "<leader>hB", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
        end,
      })
    end
  },
  "folke/which-key.nvim",
  -- "tpope/vim-commentary",
  -- use("tpope/vim-unimpaired")
  -- Cheat.sh integration
  -- use 'RishabhRD/popfix'
  -- use 'RishabhRD/nvim-cheat.sh'
  -- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "kyazdani42/nvim-web-devicons",

  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        -- open_on_setup = false,
        -- open_on_setup_file = true,
        view = {
          adaptive_size = true,
          -- mappings = {},
        },
        reload_on_bufenter = true,
        update_focused_file = {
          enable = true,
        },
        renderer = {
          indent_width = 1,
          group_empty = true,
          highlight_git = true,
        },
        filters = {
          dotfiles = true,
        },
      })

      vim.keymap.set("n", "<leader>nm", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file tree" })
      vim.keymap.set("n", "<leader>nn", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file tree" })

      -- *nvim-tree.hijack_cursor* ???
    end,
  },

  {
    "treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "help",
          -- "lua",
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
          -- "elixir",
          -- "org",
          -- "norg",
          "http",
          "regex",
          "vim",
          "markdown",
          "vue"
        },
        sync_install = false,
        playground = {
          enabled = true,
        },
        highlight = {
          enable = true,
          disable = { "spell" },
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
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = {
            "class",
            "function",
            "method",
            "for",
            "while",
            "if",
            "switch",
            "case",
            "key",
            "pair",
            "attribute",
            "jsx_expression",
            "jsx_element",
            "lexical_declaration",
            "open_tag",
          },
        },
      })

      -- FIX:  Why where are commands like [m ]m [f ]f but :map doesn't know about them. Treesitter docs
    end,
  },

  -- Right now, auto close of tree on last buffer doesn't work.
  -- Solution. Nvim-tree team said it is not posible
  -- https://github.com/nvim-tree/nvim-tree.lua/issues/1368
  "RRethy/vim-illuminate",
  -- use("liuchengxu/vista.vim")
  -- use("vimwiki/vimwiki")
  -- " use 'mattn/calendar-vim' Calendar for vim
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/playground",
  "mbbill/undotree",
  "ggandor/leap.nvim",
  {
    'ggandor/leap.nvim',
    config = function()
      require("leap").set_default_keymaps()
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      vim.api.nvim_set_hl(0, "LeapMatch", {
        fg = "white", -- for light themes, set to 'black' or similar
        bold = true,
        nocombine = true,
      })
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
    end,
  },
  "romainl/vim-cool",
  { "kevinhwang91/nvim-hlslens", opts = {} },
  -- use("kkharji/sqlite.lua")
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    opts = {
      integrations = {
        telescope = true,
        diffview = true
      }
    }
  },
  -- use("folke/todo-comments.nvim")
  -- use 'nvim-neorg/neorg' TODO: uncomment after NEOVIM 0.8
  -- use 'rest-nvim/rest.nvim'  TODO: Good concept but doesn't work
  "folke/noice.nvim",
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
  -- " use 'sidebar-nvim/sidebar.nvim' TODO: Good concept
  "nvim-lualine/lualine.nvim",
  "ntk148v/vim-horizon",
  "echasnovski/mini.nvim",
  -- use("bennypowers/nvim-regexplainer") TODO:
  -- use("andythigpen/nvim-coverage")
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
      })
    end,
  },
  "rhysd/conflict-marker.vim",
  "famiu/bufdelete.nvim",
  -- use("petertriho/nvim-scrollbar")
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  -- use 'Maan2003/lsp_lines.nvim'
  {
    'Wansmer/treesj',
    -- keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup({ use_default_keymaps = false, max_join_length = 240 })
      vim.keymap.set("n", "gJ", ":TSJToggle<CR>")
    end,
  },
  "lukas-reineke/indent-blankline.nvim",
  -- use("folke/drop.nvim")
  -- use("tamton-aquib/zone.nvim")
  "ahmedkhalf/project.nvim",
  "kylechui/nvim-surround",
  "uga-rosa/ccc.nvim",
  -- "psliwka/vim-smoothie",
  -- " use 'gorbit99/codewindow.nvim',
  "j-hui/fidget.nvim",
  { 'neoclide/coc.nvim',         branch = 'release' },
  "nvim-treesitter/nvim-treesitter-textobjects",
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  -- {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim",
  --   "neovim/nvim-lspconfig",
  -- },
  -- "hrsh7th/nvim-cmp",     -- Autocompletion plugin
  -- "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  -- "hrsh7th/cmp-buffer",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-nvim-lua",
  -- "hrsh7th/cmp-nvim-lsp-signature-help",
  --  TODO: Code action is executed on every move
  --  There is one cspell.json in the ~ as a global config
  -- "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  -- "L3MON4D3/LuaSnip",         -- Snippets plugin
  "simrat39/rust-tools.nvim",
  "p00f/nvim-ts-rainbow",
  "windwp/nvim-autopairs",
  -- use("ray-x/lsp_signature.nvim")
  "m-demare/hlargs.nvim",
  "kdheepak/lazygit.nvim",

  -- TODO: Check if now you can customize hi
  "lewis6991/satellite.nvim",
  -- use("folke/neodev.nvim")

  "justinhj/battery.nvim",
  "chaoren/vim-wordmotion",
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local bottom_style = {
        theme = "ivy",
        border = false,
        layout_config = {
          height = 15,
          width = vim.o.columns,
          preview_width = 0,
          prompt_position = "top",
        },
      }
      require("telescope").setup({
        pickers = {
          find_files = bottom_style,
          git_status = bottom_style,
          buffers = bottom_style,
          oldfiles = bottom_style,
        },
        defaults = {
          border = true,
          live_grep = {
            debounce = 250,
          },
          file_ignore_patterns = {
            "_build",
            "__localization__",
            "packer_compiled.lua",
            "package-lock.json",
          },
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              preview_height = 0.6,
            },
            height = vim.o.lines,
            width = vim.o.columns,
          },
        },
      })

      require("project_nvim").setup({
        detection_methods = { "patters" },
      })

      require("telescope").load_extension("projects")

      -- require('telescope').load_extension('coc')
      -- vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "" })
      -- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "" })
      -- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "" })
      -- vim.keymap.set("n", "<leader>fv", "<cmd>Telescope grep_string<cr>", { desc = "" })
      -- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "" })
      -- vim.keymap.set('n', '<leader>fc', '<cmd>Telescope coc<cr>', { desc = ''})
      -- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "" })

      local tl = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", tl.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "[F]ind in [T]elescope" })
      -- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "[F]ind [G]it" })
      vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "[F]ind [P]rojects" })

      vim.keymap.set("n", "<leader>fg", tl.live_grep, { desc = "[F]ind by [G]rep" })
      vim.keymap.set("n", "g/", tl.live_grep, { desc = "[F]ind by [G]rep" })
      vim.keymap.set("n", "<leader><leader>", tl.find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>?", tl.oldfiles, { desc = "[?] Find recently opened files" })
      vim.keymap.set("n", "<leader>fb", tl.buffers, { desc = "[F]ind existing [b]uffers" })
      vim.keymap.set("n", "<leader>,", tl.buffers, { desc = "[,] Find existing buffers" })
      vim.keymap.set("n", "<leader>fh", tl.help_tags, { desc = "[F]ind [H]elp" })
      vim.keymap.set("n", "<leader>fw", tl.grep_string, { desc = "[F]ind current [W]ord" })
      vim.keymap.set("n", "<leader>fd", tl.diagnostics, { desc = "[F]ind [D]iagnostics" })
      vim.keymap.set("n", "<leader>/", function()
        tl.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer]" })
    end,
  }

  -- use({
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "haydenmeade/neotest-jest",
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- })
  --
}

)


-- surrounds ys, ds, cs
-- treesitter folding??
-- prettierd is pretty fast
-- root is delivery not acc in proj
-- disable saga scroll
-- saga floating window still bug
-- cspell, auto pairs
-- \ as key
-- tab completion
-- cmd doesn't suggest object\s fields
--
--


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


vim.g.coc_global_extensions = { 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver',
  'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua',
  'coc-rust-analyzer', 'coc-go', '@yaegassy/coc-volar', '@yaegassy/coc-tailwindcss3' }

-- Show line diagnostics automatically in hover window
--
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })


-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })


-- Formatting selected code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
  group = "CocGroup",
  pattern = "typescript,json",
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = { silent = true, nowait = true }
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply source code actions for current file.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>",
  'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>",
  'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
