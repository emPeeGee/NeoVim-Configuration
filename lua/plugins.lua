local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
  use({ "ellisonleao/gruvbox.nvim" })
  use("lifepillar/vim-solarized8")
  use("ryanoasis/vim-devicons")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  -- use 'fannheyward/telescope-coc.nvim'
  use("nvim-telescope/telescope-symbols.nvim")
  -- " IDEA: Then exploring new file, get outline an see the file
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("folke/which-key.nvim")
  use("tpope/vim-commentary")
  -- use("tpope/vim-unimpaired")
  -- Cheat.sh integration
  -- use 'RishabhRD/popfix'
  -- use 'RishabhRD/nvim-cheat.sh'
  -- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("RRethy/vim-illuminate")
  use("liuchengxu/vista.vim")
  use("vimwiki/vimwiki")
  -- " use 'mattn/calendar-vim' Calendar for vim
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-treesitter/playground")
  use("mbbill/undotree")
  use("ggandor/leap.nvim")
  use("nvim-neotest/neotest")
  -- " use 'nvim-neotest/neotest-go'
  -- " use 'haydenmeade/neotest-jest'
  use("romainl/vim-cool")
  use("inside/vim-search-pulse")
  use("kevinhwang91/nvim-hlslens")
  -- use("kkharji/sqlite.lua")
  use("TimUntersberger/neogit")
  use("folke/todo-comments.nvim")
  -- " use 'nvim-neorg/neorg' TODO: uncomment after NEOVIM 0.8
  -- " use 'rest-nvim/rest.nvim'  TODO: Good concept but doesn't work
  use("folke/noice.nvim")
  use("MunifTanjim/nui.nvim")
  use("rcarriga/nvim-notify")
  -- " use 'sidebar-nvim/sidebar.nvim' TODO: Good concept
  use("nvim-lualine/lualine.nvim")
  use("ntk148v/vim-horizon")
  use("echasnovski/mini.nvim")
  -- use("bennypowers/nvim-regexplainer") TODO:
  -- use("andythigpen/nvim-coverage")
  use("sindrets/diffview.nvim")
  use("rhysd/conflict-marker.vim")
  use("famiu/bufdelete.nvim")
  -- use("petertriho/nvim-scrollbar")
  use("max397574/better-escape.nvim")
  -- use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  -- use 'Maan2003/lsp_lines.nvim'
  use("Wansmer/treesj")
  use("lukas-reineke/indent-blankline.nvim")
  -- use("folke/drop.nvim")
  -- use("tamton-aquib/zone.nvim")
  use("ahmedkhalf/project.nvim")
  use("kylechui/nvim-surround")
  use("uga-rosa/ccc.nvim")
  use("folke/trouble.nvim")
  use("psliwka/vim-smoothie")
  -- " use 'gorbit99/codewindow.nvim',
  use("j-hui/fidget.nvim")
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- vim.g['coc_global_extensions'] = ({'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go'})
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
  })
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("jose-elias-alvarez/null-ls.nvim")
  use("glepnir/lspsaga.nvim")
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip") -- Snippets plugin
  use("simrat39/rust-tools.nvim")
  use("p00f/nvim-ts-rainbow")
  use("windwp/nvim-autopairs")
  -- use("ray-x/lsp_signature.nvim")
  use("m-demare/hlargs.nvim")
  use("kdheepak/lazygit.nvim")

  -- TODO: Check if now you can customize hi
  use("lewis6991/satellite.nvim")
  -- use("folke/neodev.nvim")

  use("justinhj/battery.nvim")

  use("nvim-orgmode/orgmode")
  use 'ray-x/go.nvim'
  -- use 'ray-x/guihua.lua' -- recommended if need floating window support
  -- local has_plugins, plugins = pcall(require, "custom.plugins")
  -- if has_plugins then
  --   plugins(use)
  -- end

  -- if is_bootstrap then
  --   require("packer").sync()
  -- end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
-- if is_bootstrap then
--   print("==================================")
--   print("    Plugins are being installed")
--   print("    Wait until Packer completes,")
--   print("       then restart nvim")
--   print("==================================")
--   return
-- end

-- Automatically source and re-compile packer whenever you save this file
-- local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   command = "source <afile> | PackerCompile",
--   group = packer_group,
--   pattern = vim.fn.expand("$MYVIMRC"),
-- })
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

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
