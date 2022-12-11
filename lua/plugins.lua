-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use  'morhetz/gruvbox'
  use  'NLKNguyen/papercolor-theme'
  use  'lifepillar/vim-solarized8'
  use  'ryanoasis/vim-devicons'
  use  'nvim-lua/plenary.nvim'
  use  'nvim-telescope/telescope.nvim'
  use  'fannheyward/telescope-coc.nvim'
  use  'nvim-telescope/telescope-symbols.nvim'
  -- " IDEA: Then exploring new file, get outline an see the file
  -- " use  'nvim-telescope/telescope-frecency.nvim'
  -- " use  'wfxr/minimap.vim'
  -- " use  'mhinz/vim-startify'
  -- " use  'airblade/vim-gitgutter'
  use  'tpope/vim-fugitive'
  use  'lewis6991/gitsigns.nvim'

  use {'neoclide/coc.nvim', branch = 'release'}
  vim.g['coc_global_extensions'] = ({'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go'})
  -- " 'coc-tabnine' 

  use  'lewis6991/spellsitter.nvim'
  -- " use  'liuchengxu/vim-which-key'
  use  'folke/which-key.nvim'

  use  'tpope/vim-commentary'
  use  'tpope/vim-unimpaired'
  use  'tpope/vim-surround'

  -- " use  'RishabhRD/popfix'
  -- " use  'RishabhRD/nvim-cheat.sh'

  -- " use  'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


  -- use  'kyazdani42/nvim-web-devicons' " optional, for file icons
  use  'kyazdani42/nvim-tree.lua'

  use  'RRethy/vim-illuminate'

  use  'liuchengxu/vista.vim'
  use  'vimwiki/vimwiki'

  -- " use  'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  -- " Calendar for vim
  -- " use  'mattn/calendar-vim'

  use  'puremourning/vimspector'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use  'nvim-treesitter/nvim-treesitter-context'
  use  'nvim-treesitter/playground'

  -- " use  'kshenoy/vim-signature'

  use  'mbbill/undotree'

  -- " Enhanced navigation
  use  'ggandor/lightspeed.nvim'
  -- " use  'ggandor/leap.nvim'
  -- " An always-on highlight for a unique character in every word on a line to help you use f, F
  -- " use  'unblevable/quick-scope'
  -- " use  'guns/vim-sexp',    {'for': 'clojure'}
  -- " use  'liquidz/vim-iced', {'for': 'clojure'}
  -- " Using vim-plug
  -- " use  'elixir-editors/vim-elixir'


  use  'nvim-neotest/neotest'
  -- " use  'nvim-neotest/neotest-go'
  -- " use  'haydenmeade/neotest-jest'

  use  'romainl/vim-cool'
  use  'inside/vim-search-pulse'
  use  'kevinhwang91/nvim-hlslens'

  use  'kkharji/sqlite.lua'
  use  'TimUntersberger/neogit'


  use { 'folke/todo-comments.nvim'} -- " TODO: Map keys"

  use { 'rest-nvim/rest.nvim'}
  --  handy but why? 
  -- use { 'nvim-neorg/neorg' TODO: uncomment after NEOVIM 0.8
  -- use { 'rest-nvim/rest.nvim'  TODO: Good concept but doesn't work
  -- use { 'mvllow/modes.nvim'

  use { 'folke/noice.nvim'}
  use { 'MunifTanjim/nui.nvim'}
  use { 'rcarriga/nvim-notify'}
  use { 'hrsh7th/nvim-cmp'}
  -- " use { 'mrjones2014/legendary.nvim'}
  -- " use { 'sidebar-nvim/sidebar.nvim' TODO: Good concept
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  use { 'nvim-lualine/lualine.nvim'}
  use { 'ntk148v/vim-horizon'}

  use { 'echasnovski/mini.nvim'}
  use { 'bennypowers/nvim-regexplainer'}

  use { 'andythigpen/nvim-coverage'}
  use { 'sindrets/diffview.nvim'}
  use { 'rhysd/conflict-marker.vim'}
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim' }

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}



  use { 'famiu/bufdelete.nvim'}
  use { 'petertriho/nvim-scrollbar'}
  use { 'max397574/better-escape.nvim'}

  use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'}
  use { 'Wansmer/treesj'}
  use  {'lukas-reineke/indent-blankline.nvim'}
  use { 'folke/drop.nvim'}
  use{  'tamton-aquib/zone.nvim' }

end)


