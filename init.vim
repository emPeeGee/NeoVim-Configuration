call plug#begin("~/.vim/plugged")
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'lifepillar/vim-solarized8'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' 
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'
  " IDEA: Then exploring new file, get outline an see the file
  Plug 'nvim-telescope/telescope-frecency.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go', 'coc-vimlsp']
  " 'coc-tabnine' 
  Plug 'lewis6991/spellsitter.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  " Cheat.sh integration
  " Plug 'RishabhRD/popfix'
  " Plug 'RishabhRD/nvim-cheat.sh'
  " Go lang
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'RRethy/vim-illuminate'
  Plug 'liuchengxu/vista.vim'
  Plug 'vimwiki/vimwiki'
  " Calendar for vim
  " Plug 'mattn/calendar-vim'
  Plug 'puremourning/vimspector'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'nvim-treesitter/playground'
  Plug 'mbbill/undotree'
  Plug 'ggandor/lightspeed.nvim'
  " Plug 'ggandor/leap.nvim'
  " An always-on highlight for a unique character in every word on a line to help you use f, F
  " Plug 'unblevable/quick-scope'
  " Plug 'guns/vim-sexp',    {'for': 'clojure'}
  " Plug 'liquidz/vim-iced', {'for': 'clojure'}
  " Using vim-plug
  " Plug 'elixir-editors/vim-elixir'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-neotest/neotest'
  " Plug 'nvim-neotest/neotest-go'
  " Plug 'haydenmeade/neotest-jest'
  Plug 'romainl/vim-cool'
  Plug 'inside/vim-search-pulse'
  Plug 'kevinhwang91/nvim-hlslens'
  Plug 'kkharji/sqlite.lua'
  Plug 'TimUntersberger/neogit'
  Plug 'folke/todo-comments.nvim'
  Plug 'rest-nvim/rest.nvim'
  " handy but why? 
  " Plug 'nvim-neorg/neorg' TODO: uncomment after NEOVIM 0.8
  " Plug 'rest-nvim/rest.nvim'  TODO: Good concept but doesn't work
  " Plug 'mvllow/modes.nvim'
  Plug 'folke/noice.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'rcarriga/nvim-notify'
  Plug 'hrsh7th/nvim-cmp'
  " Plug 'mrjones2014/legendary.nvim'
  " Plug 'sidebar-nvim/sidebar.nvim' TODO: Good concept
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'ntk148v/vim-horizon'
  Plug 'echasnovski/mini.nvim'
  Plug 'bennypowers/nvim-regexplainer'
  Plug 'MunifTanjim/nui.nvim',
  Plug 'andythigpen/nvim-coverage'
  Plug 'sindrets/diffview.nvim'
  Plug 'rhysd/conflict-marker.vim'
  Plug 'famiu/bufdelete.nvim'
  Plug 'petertriho/nvim-scrollbar'
  Plug 'max397574/better-escape.nvim'
  Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  Plug 'Wansmer/treesj'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'folke/drop.nvim'
  Plug 'tamton-aquib/zone.nvim' 
  Plug 'gelguy/wilder.nvim'
  Plug 'ahmedkhalf/project.nvim'
  Plug 'kylechui/nvim-surround'
  Plug 'uga-rosa/ccc.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'psliwka/vim-smoothie'
  Plug 'gorbit99/codewindow.nvim',
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

syntax on

function! SetHorizon()
  colorscheme horizon
  highlight! link SignColumn LineNr
  hi illuminatedWord guifg=white guibg=grey50
  :lua require('lualine').setup{options = { theme = 'horizon' }}
endfunction

function! SetDarkTheme()
  let g:gruvbox_contrast_dark='soft'
  set background=dark
  colorscheme gruvbox
  highlight! link SignColumn LineNr
  hi illuminatedWord guifg=white guibg=grey50
  :lua require('lualine').setup{options = { theme = 'gruvbox-material' }}
endfunction

function! SetLightTheme()
  set background=light
  colorscheme solarized8_high
  colo solarized8_high
  highlight! link SignColumn LineNr
  hi LineNr guibg=NONE
  hi illuminatedWord guifg=white guibg=grey50

  call SetupLightline('solarized')
  :lua require('lualine').setup{options = { theme = 'gruvbox_light'}}
endfunction


call SetDarkTheme()

" NeoVim default settings
" Settings
let mapleader = "\<Space>"
let g:mapleader="\<Space>"

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
set completeopt=longest,menuone
set mouse=a
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
set noswapfile
set number relativenumber
set title
" Wrap lines.
set wrap
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" Folding auto mode
set foldmethod=indent
set foldlevel=2
set foldnestmax=10
set nofoldenable

" keep 20 lines visible above and below cursor at all times
set scrolloff=15  
" set sidescrolloff=10   " keep 30 columns visible left and right of the cursor at all time

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" Reduce updatetime
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" persist
" set undofile " Maintain undo history between sessions
" set undodir=~/.vim/undodir
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

set nospell
" set spell spelllang=en_us

" Show signcolumn before line number
set signcolumn=yes

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

set list
set listchars=tab:»·,trail:·

set colorcolumn=80,120
set noruler

" set wildmenu
" set wildmode=list:full

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
" set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" set wildignore+=*/node_modules/*

set incsearch " Show results as you type
set hlsearch  " Highlight the search results 


" Find recursive, not just in current folder
set path+=**


" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" highlight the visual selection after pressing enter.
xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>

" Highlight matching parenthesis
hi MatchParen guibg=magenta guifg=white


" If you select some lines then press > to indent the lines, the selection is removed. The indentation can be repeated on the same range using ., but if you still want to retain the visual selection after having pressed > or <, you can use these mappings
vnoremap > >gv
vnoremap < <gv


" Neovim non plugin keybindings
" Buffer maps
nnoremap <Leader>bh :bprevious<CR>
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bk :bfirst<CR>
nnoremap <Leader>bj :blast<CR>
nnoremap <Leader>bx :bd<CR>
nnoremap <Leader>bq :ls<CR>
nmap <silent> [d :Bdelete <CR>

" Move the line using alt and jk https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Miscellaneous
" Open vim init 
nnoremap <leader>ov :e $MYVIMRC<CR>
nnoremap <leader>oc :source $MYVIMRC<CR>
nnoremap <leader>opi :PlugInstall<CR>
nnoremap <leader>opc :PlugClean<CR>


" Toggle relativenumber
nnoremap <leader>or :set relativenumber!<Cr>

" Toggle spelling
nnoremap <leader>os :set spell! <CR>

"Unset the last search pattern
nnoremap <leader>oh :noh<CR><CR> 
" Theme toggler
nnoremap <leader>ol <cmd>:call SetLightTheme()<cr>
nnoremap <leader>od <cmd>:call SetDarkTheme()<cr>
nnoremap <leader>oq <cmd>:call SetHorizon()<cr>
nnoremap <leader>ou :UndotreeToggle<CR>

nnoremap <leader>ott <cmd>Vista!!<cr>
nnoremap <leader>otc <cmd>Vista coc<cr>

" Coc config
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
nnoremap <leader>tf :call CocAction('runCommand', 'jest.fileTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

xmap <leader>cd  <Plug>(coc-codeaction-selected)
nmap <leader>cd  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cv  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Coc settings end


" WhichKey
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Open whichkey after 500ms
set timeoutlen=500


" Enrich go linter
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']
" Auto imports for go
let g:go_fmt_command = "goimports"
" Show type in bottom of screen
let g:go_auto_type_info = 1

" Keybindings
" nnoremap <Leader>ll :GoRun<CR>
" nnoremap <Leader>ld :GoDeclsDir<CR>

" nnoremap <F6> :w <CR> :GoTestCompile <CR> <CR>
" inoremap <F6> <ESC> :w <CR> :GoTestCompile <CR> <CR>

" Telescope
" Keybindings
nnoremap <leader>ft <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fr <cmd>Telescope frecency workspace=CWD<cr>
nnoremap <leader>fe <cmd>Telescope frecency<cr>
nnoremap <leader>fv <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fc <cmd>Telescope coc<cr>
nnoremap <leader>fp <cmd>Telescope projects<cr>


nnoremap <leader>tl <cmd>TodoLocList<cr>
nnoremap <leader>tq <cmd>TodoQuickFix<cr>
nnoremap <leader>tt <cmd>TodoTelescope<cr>

" Quick-scope
let g:qs_delay = 150
let g:qs_filetype_blacklist = ['startify']
let g:qs_buftype_blacklist = ['nofile']
" Keybindings
nnoremap <leader>nm <cmd>NvimTreeFindFileToggle<CR>
nnoremap <leader>nn <cmd>NvimTreeFocus<cr>


" GitGutter
highlight! link SignColumn LineNr

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]


lua << EOF
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

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "javascript", "typescript", "scss",   "yaml", "tsx", "regex", "json", "html", "go", "css", "comment", "elixir", "norg", "http", "haskell", "regex" },
  sync_install = false,
  playground = {
    enabled = true
  },
  highlight = {
    enable = true,
    disable = {"c"},
    additional_vim_regex_highlighting = false,
  },
}


-- Treesitter context
require('treesitter-context').setup{
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


 require "telescope".setup {
   pickers = {
     find_files = {
     theme = 'ivy',
     border = false,
      layout_config = {
        height = 15,
        width = vim.o.columns,
        preview_width = 0,
        prompt_position = "bottom",
      },
    }
   },
   defaults = {
     theme = 'ivy',
     border = true,
     live_grep = {
       debounce = 250,
     },
     file_ignore_patterns = {
       "_build",
       "__localization__"
     },
     layout_strategy = "vertical",
      layout_config = {
        height = vim.o.lines,
        width = vim.o.columns,
        preview_height = 0.6,
      },
   },
 }

require('telescope').load_extension('coc')
require"telescope".load_extension("frecency")

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

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require('lualine').setup({
options = {
  globalstatus = true,
},
extensions = {'nvim-tree'},
sections = {
  --lualine_b = {'branch', 'diff', 'diagnostics'}, FIX: is not working https://github.com/nvim-lualine/lualine.nvim/issues/799
  lualine_b = {'branch',{'diff', source = diff_source}, 'diagnostics'},
  lualine_x = {'filesize'}
  }
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


local wilder = require('wilder')
wilder.setup({modes = {':'}})
wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
    min_width = '100%', -- minimum height of the popupmenu, can also be a number
    max_height = '30%', -- to set a fixed height, set max_height to the same value
    reverse = 0,        -- if 1, shows the candidates from bottom to top
  }),
}))
wilder.set_option('use_python_remote_plugin', 0)

-- require("drop").setup({
  -- theme = "snow", -- can be one of rhe default themes, or a custom theme
--   max = 100, -- maximum number of drops on the screen
  -- interval = 150, -- every 150ms we update the drops
  -- screensaver = 1000 * 60 * 2, -- show after 5 minutes. Set to false, to disable
 --  filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
-- })
--  require("zone").setup()
require("project_nvim").setup {    }
require('telescope').load_extension('projects')

require('nvim-surround').setup({ })

vim.opt.termguicolors = true

local ccc = require("ccc")
local mapping = ccc.mapping
ccc.setup({
highlighter = {
  auto_enable = true
  }
})
require("trouble").setup {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 8, -- height of the trouble list when position is top or bottom
  icons = true, -- use devicons for filenames
  auto_open = true, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  mode = "loclist"
}

local codewindow = require('codewindow')
codewindow.setup({
  minimap_width = 10,
  width_multiplier = 8,
  auto_enable = true,
  exclude_filetypes = { 'NvimTree' },
  window_border = 'none'
})

EOF


nmap <silent> gL <cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><cmd>TroubleToggle loclist<CR>

" imap jj <Esc>

" au VimEnter,BufRead *.* :lua MiniMap.open()

" Fugitive
" Make diff vertical
set diffopt+=vertical

" Keybindings
nnoremap <leader>gg <cmd>Neogit<cr>
nnoremap <leader>gm <cmd>Gdiffsplit!<cr>
nnoremap <leader>gb <cmd>Git blame<cr>

" Diffview
nnoremap <leader>go <cmd>DiffviewOpen<CR>
nnoremap <leader>gc <cmd>DiffviewClose<CR>
nnoremap <leader>gl <cmd>DiffviewFileHistory<CR>
nnoremap <leader>gf <cmd>DiffviewFileHistory %<CR>


" Neotest
nnoremap <leader>rr <cmd>lua require("neotest").run.run()<CR>
nnoremap <leader>rf <cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nnoremap <leader>rl <cmd>lua require("neotest").run.run_last()<CR>
nnoremap <leader>rx <cmd>lua require("neotest").run.stop()<CR>
nnoremap <leader>rs <cmd>lua require("neotest").summary.toggle()<CR>
nnoremap <silent>[n <cmd>lua require("neotest").jump.prev()<CR>
nnoremap <silent>]n <cmd>lua require("neotest").jump.next()<CR>

nnoremap <leader>tc :CoverageToggle<CR>

" Handy for angular https://www.reddit.com/r/vim/comments/fedjzm/open_angular_counterpart_html_or_ts_files/


" Get rid of the artifacts
autocmd CompleteDone <buffer> if has_key(v:completed_item, 'word') && v:completed_item.word =~ '\.$'
\| call feedkeys("\<bs>")
\| endif


" vimwiki
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end


set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
   \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
   \,sm:block-blinkwait175-blinkoff150-blinkon175



" Highlight on yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})
augroup END

imap jj <Esc>

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'


highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81


hi DiffAdd      gui=none    guifg=NONE          guibg=#2e5049
hi DiffChange   gui=none    guifg=NONE          guibg=#344f69
hi DiffText     gui=none    guifg=NONE          guibg=#5f3469
hi DiffDelete   gui=none    guifg=NONE          guibg=#693434
hi DiffviewDiffAddAsDelete  gui=none guifg=NONE guibg=#693434

hi GitSignsChangeInline     gui=none    guifg=NONE          guibg=#5f3469
hi GitSignsAddInline     gui=none    guifg=NONE          guibg=#5f3469
hi GitSignsDeleteInline     gui=none    guifg=NONE          guibg=#5f3469

hi! CocInfoSign guifg=LightBlue
" hi! CocErrorSign guibg=none
" hi! CocInfoSign guibg=#353b45
" hi! CocWarningSign guifg=#d1cd66


if exists("g:neovide")
  let g:neovide_scale_factor = 0.85
  let g:neovide_fullscreen = v:true
endif

hi def IlluminatedWordText guibg=#6b496e
hi def IlluminatedWordRead guibg=#6b496e
hi def IlluminatedWordWrite guibg=#6b496e

hi ScrollbarHandle guibg=#ABB2B9
hi ScrollbarCursorHandle guibg=#ABB2B9
hi ScrollbarCursor guibg=#ABB2B9
" TODO: Here
hi ScrollbarGitAdd guibg=green
hi ScrollbarGitAddHandle guibg=green
hi ScrollbarGitChange guibg=violet
hi ScrollbarGitChangeHandle guibg=violet
hi ScrollbarGitDelete guibg=red
hi ScrollbarGitDeleteHandle guibg=red

" Oxocarbon is good theme
" quickfix window
