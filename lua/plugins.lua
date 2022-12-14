-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'morhetz/gruvbox'
  use 'lifepillar/vim-solarized8'
  use 'ryanoasis/vim-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'fannheyward/telescope-coc.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  -- " IDEA: Then exploring new file, get outline an see the file
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'lewis6991/spellsitter.nvim'
  use 'folke/which-key.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
   -- Cheat.sh integration
   -- use 'RishabhRD/popfix'
   -- use 'RishabhRD/nvim-cheat.sh'
   -- use 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'RRethy/vim-illuminate'
  use 'liuchengxu/vista.vim'
  use 'vimwiki/vimwiki'
  -- " use 'mattn/calendar-vim' Calendar for vim
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/playground'
  use 'mbbill/undotree'
  use 'ggandor/lightspeed.nvim'
  -- " use 'ggandor/leap.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-neotest/neotest'
  -- " use 'nvim-neotest/neotest-go'
  -- " use 'haydenmeade/neotest-jest'
  use 'romainl/vim-cool'
  use 'inside/vim-search-pulse'
  use 'kevinhwang91/nvim-hlslens'
  use 'kkharji/sqlite.lua'
  use 'TimUntersberger/neogit'
  use 'folke/todo-comments.nvim'
  use 'rest-nvim/rest.nvim'
  -- " use 'nvim-neorg/neorg' TODO: uncomment after NEOVIM 0.8
  -- " use 'rest-nvim/rest.nvim'  TODO: Good concept but doesn't work
  use 'folke/noice.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'rcarriga/nvim-notify'
  use 'hrsh7th/nvim-cmp'
  -- " use 'mrjones2014/legendary.nvim'
  -- " use 'sidebar-nvim/sidebar.nvim' TODO: Good concept
  use 'nvim-lualine/lualine.nvim'
  use 'ntk148v/vim-horizon'
  use 'echasnovski/mini.nvim'
  use 'bennypowers/nvim-regexplainer'
  use 'MunifTanjim/nui.nvim'
  use 'andythigpen/nvim-coverage'
  use 'sindrets/diffview.nvim'
  use 'rhysd/conflict-marker.vim'
  use 'famiu/bufdelete.nvim'
  use 'petertriho/nvim-scrollbar'
  use 'max397574/better-escape.nvim'
 --  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  use 'Wansmer/treesj'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'folke/drop.nvim'
  use 'tamton-aquib/zone.nvim'
  use 'gelguy/wilder.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'kylechui/nvim-surround'
  use 'uga-rosa/ccc.nvim'
  use 'folke/trouble.nvim'
  use 'psliwka/vim-smoothie'
  -- " use 'gorbit99/codewindow.nvim',

  use {'neoclide/coc.nvim', branch = 'release'}
  vim.g['coc_global_extensions'] = ({'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go'})
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
end)


