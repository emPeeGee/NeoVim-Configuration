local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	use({ "ellisonleao/gruvbox.nvim" })
	use("lifepillar/vim-solarized8")
	use("ryanoasis/vim-devicons")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-symbols.nvim")
	-- " IDEA: Then exploring new file, get outline an see the file
	-- use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("folke/which-key.nvim")
	use("tpope/vim-commentary")
	-- use("tpope/vim-unimpaired")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("RRethy/vim-illuminate")
	use("liuchengxu/vista.vim")
	use("vimwiki/vimwiki")
	use("mbbill/undotree")
	use("ggandor/leap.nvim")
	use("nvim-neotest/neotest")
	-- " use 'nvim-neotest/neotest-go'
	use("haydenmeade/neotest-jest")
	use("romainl/vim-cool")
	use("kevinhwang91/nvim-hlslens")
	-- use("kkharji/sqlite.lua")
	use("TimUntersberger/neogit")
	use("folke/todo-comments.nvim")
	use("nvim-neorg/neorg")
	-- use("folke/noice.nvim")
	-- use("rcarriga/nvim-notify")
	-- " use 'sidebar-nvim/sidebar.nvim' TODO: Good concept
	use("nvim-lualine/lualine.nvim")
	use("echasnovski/mini.nvim")
	use("sindrets/diffview.nvim")
	use("rhysd/conflict-marker.vim")
	use("famiu/bufdelete.nvim")
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
	use("j-hui/fidget.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/playground")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use({
	--   "akinsho/bufferline.nvim",
	--   tag = "v3.*",
	--   requires = "nvim-tree/nvim-web-devicons",
	-- })
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
	-- use("glepnir/lspsaga.nvim")
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
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	use("dstein64/vim-startuptime")
end)

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
