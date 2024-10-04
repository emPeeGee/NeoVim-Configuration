-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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
    -- { import = "morhetz/gruvbox" },
  -- },
  {"morhetz/gruvbox", lazy = false},
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
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
  "tpope/vim-commentary",
  -- use("tpope/vim-unimpaired")
  -- Cheat.sh integration
  -- use 'RishabhRD/popfix'
  -- use 'RishabhRD/nvim-cheat.sh'
  -- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
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
  "kevinhwang91/nvim-hlslens",
  -- use("kkharji/sqlite.lua")
  "TimUntersberger/neogit",
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
  "psliwka/vim-smoothie",
  -- " use 'gorbit99/codewindow.nvim',
  "j-hui/fidget.nvim",
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- vim.g['coc_global_extensions'] = ({'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go'})
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp-signature-help",
--  TODO: Code action is executed on every move
--  There is one cspell.json in the ~ as a global config
  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  "L3MON4D3/LuaSnip", -- Snippets plugin
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
})


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
