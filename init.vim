call plug#begin("~/.vim/plugged")
  " Theme and coloring
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'lifepillar/vim-solarized8'
 
  " Icons for vim
  Plug 'ryanoasis/vim-devicons'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' 
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'
  " Plug 'nvim-telescope/telescope-frecency.nvim'

  " Minimap
  " Plug 'wfxr/minimap.vim' 

  " Start screen
  " Plug 'mhinz/vim-startify'

  " Git
  " Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'

  " Buffer line on the bottom
  " Plug 'itchyny/lightline.vim'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer']
  " 'coc-tabnine' 

  Plug 'lewis6991/spellsitter.nvim'
 
  " Which key
  " Plug 'liuchengxu/vim-which-key'
  Plug 'folke/which-key.nvim'

  " Tim Pope
  Plug 'tpope/vim-commentary' " Comment out lines
  Plug 'tpope/vim-unimpaired' " Tpope pairs of mappings
  Plug 'tpope/vim-surround'   " Surround

  " Cheat.sh integration
  " Plug 'RishabhRD/popfix'
  " Plug 'RishabhRD/nvim-cheat.sh'

  " Go lang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " File tree  
  " Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

  Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
  Plug 'kyazdani42/nvim-tree.lua'

  " Highlight word under cursor
  Plug 'RRethy/vim-illuminate'

  " A class outline viewer for Vim
  Plug 'liuchengxu/vista.vim'

  " I guess something like org-mode
  Plug 'vimwiki/vimwiki'

  " Color Highlight
  " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " Calendar for vim
  " Plug 'mattn/calendar-vim'

  " Debugging
  Plug 'puremourning/vimspector'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-context'

  " Show marks on signcolumn
  " Plug 'kshenoy/vim-signature'

  " View undo list visually
  Plug 'mbbill/undotree'

  " Enhanced navigation
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
  Plug 'nvim-neotest/neotest-go'
  Plug 'haydenmeade/neotest-jest'

  " hlsearch
  Plug 'romainl/vim-cool'
  Plug 'inside/vim-search-pulse'
  Plug 'kevinhwang91/nvim-hlslens'

  Plug 'kkharji/sqlite.lua'
  Plug 'TimUntersberger/neogit'

  Plug 'folke/todo-comments.nvim' " TODO: Map keys"

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
call plug#end()

" Appearance
" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Turn syntax highlighting on.
syntax on

" Lightline
" Get file name from git root
" function! LightlineFilename()
"   let root = fnamemodify(get(b:, 'git_dir'), ':h')
"   let path = expand('%:p')
"   if path[:len(root)-1] ==# root
"     return path[len(root)+1:]
"   endif
"   return expand('%')
" endfunction

" Show additions, removals and changes of current buffer in lightline
" function! GitSignsStatus()
"   return get(b:,'gitsigns_status','')
" endfunction

function SetupLightline(colorscheme)
  " Lightline Remove redundant statusline -- MODE --
  set noshowmode

  " let g:lightline = {
  "   \ 'colorscheme': a:colorscheme,
  "   \ 'active': {
  "   \   'left': [ ['mode', 'paste'],
  "   \             ['gitbranch', 'readonly', 'filename' , 'modified'],
  "   \             ['venv', 'readonly']],
  "   \   'right': [['lineinfo'], ['percent'], ['filetype'], ['gitsignsstatus']],
  "   \ },
  "   \ 'component_function': {
  "   \   'gitbranch': 'fugitive#head',
  "   \   'venv': 'virtualenv#statusline',
  "   \   'filename': 'LightlineFilename',
  "   \   'gitsignsstatus': 'GitSignsStatus',
  "   \ },
  "   \ }

  " call lightline#init()
  " call lightline#colorscheme()
  " call lightline#update()
endfunction

function! SetHorizon()
  " let g:gruvbox_contrast_dark='soft'
  " set background=dark
  colorscheme horizon

  " highlight Cursor guifg=white guibg=reverse
  " highlight iCursor guifg=white guibg=reverse
  highlight! link SignColumn LineNr
  hi illuminatedWord guifg=white guibg=grey50

  call SetupLightline('wombat')

  " :lua require('lualine').setup{options = { theme = 'gruvbox-material' }}
  :lua require('lualine').setup{options = { theme = 'horizon' }}
endfunction

function! SetDarkTheme()
  let g:gruvbox_contrast_dark='soft'
  set background=dark
  colorscheme gruvbox

  " highlight Cursor guifg=white guibg=reverse
  " highlight iCursor guifg=white guibg=reverse
  highlight! link SignColumn LineNr
  hi illuminatedWord guifg=white guibg=grey50

  call SetupLightline('wombat')

  :lua require('lualine').setup{options = { theme = 'gruvbox-material' }}
endfunction

function! SetLightTheme()
  set background=light
  colorscheme solarized8_high
  colo solarized8_high

  " highlight Cursor guifg=reverse guibg=#0087ff
  " highlight iCursor guifg=reverse guibg=#0087ff
  highlight! link SignColumn LineNr

  " set guicursor=n-v-c:block-Cursor
  " set guicursor+=i:ver100-iCursor
  " set guicursor+=n-v-c:blinkon0
  " set guicursor+=i:blinkwait10

  hi LineNr guibg=NONE
  hi illuminatedWord guifg=white guibg=grey50

  call SetupLightline('solarized')
  :lua require('lualine').setup{options = { theme = 'gruvbox_light'}}
endfunction


"Change theme depending on the time of day
" let hr = (strftime('%H'))
" if hr >= 19
"   call SetDarkTheme()
" elseif hr >= 8
"   call SetLightTheme()
" elseif hr >= 0
  call SetDarkTheme()
" endif


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

" Make nvim use global clipboard
" set clipboard=unnamedplus

" disable default spell checker
set nospell

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

set wildmenu
set wildmode=list:full

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildignore+=*/node_modules/*

set incsearch " Show results as you type
set hlsearch  " Highlight the search results 

set spell spelllang=en_us

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
nmap <silent> [d :bd <CR>

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

"Unsets the last search pattern
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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
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


" WhickKey
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Open whichkey after 500ms
set timeoutlen=500

" Vim-go -> Go setup
" Highlight variable with same name when cursor is on them
" I guess the below highlights are the same as treesitter provides
" let g:go_auto_sameids = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_types = 1

" Enrich go linter
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']

" Auto imports for go
let g:go_fmt_command = "goimports"
" Show type in bottom of screen
let g:go_auto_type_info = 1

" Keybindings
nnoremap <Leader>ll :GoRun<CR>
nnoremap <Leader>ld :GoDeclsDir<CR>

nnoremap <F6> :w <CR> :GoTestCompile <CR> <CR>
inoremap <F6> <ESC> :w <CR> :GoTestCompile <CR> <CR>


" Git blamer
" let g:blamer_enabled = 1
" let g:blamer_delay = 1000


" Minimap
" let g:minimap_width = 10
" let g:minimap_auto_start = 0 " Disable autostart
" let g:minimap_auto_start_win_enter = 0
" let g:minimap_git_colors = 1 " Use with git 

" Keybindings
" nnoremap <leader>mm :MinimapToggle<CR>
" nnoremap <leader>mr :MinimapRescan<CR>
" nnoremap <leader>ms :MinimapRefresh<CR>


" Telescope
" Keybindings
nnoremap <leader>ft <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fr <cmd>Telescope frecency workspace=CWD<cr>
" nnoremap <leader>fe <cmd>Telescope frecency<cr>
nnoremap <leader>fv <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fc <cmd>Telescope coc<cr>


nnoremap <leader>tl <cmd>TodoLocList<cr>
nnoremap <leader>tq <cmd>TodoQuickFix<cr>
nnoremap <leader>tt <cmd>TodoTelescope<cr>

" Quick-scope
let g:qs_delay = 150
let g:qs_filetype_blacklist = ['startify']
let g:qs_buftype_blacklist = ['nofile']


" CHADTree
" set width of the file tree
" let g:chadtree_settings = {"view.width": 30}

" Autoclose chadtree if it the last window left
" autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif

" Keybindings
nnoremap <leader>nm <cmd>NvimTreeFindFileToggle<CR>
nnoremap <leader>nn <cmd>NvimTreeFocus<cr>


" GitGutter
highlight! link SignColumn LineNr
" highlight GitGutterAdd    guifg=#009900
" highlight GitGutterChange guifg=#bbbb00
" highlight GitGutterDelete guifg=#ff2222
"let g:gitgutter_highlight_lines = 1


" Hexokinase
" All possible highlighters
let g:Hexokinase_highlighters = [
\   'backgroundfull',
\ ]


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


" Treesitter
lua << EOF

require'gitsigns'.setup{
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true, -- color is ...

  sign_priority = 1,

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
    file_ignore_patterns = {
      "_build"
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

require('spellsitter').setup()
require("neotest").setup({
  adapters = {
    require('neotest-go'),
    require('neotest-jest')({
      jestCommand = 'npm test --',
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
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
options = {
  globalstatus = true,
  },
extensions = {'nvim-tree'},
sections = {
  lualine_x = {'filesize'}
  }
})

require('mini.starter').setup()

local map = require('mini.map')
map.setup({
-- symbols = {
--   encode = map.gen_encode_symbols.shade('1x2'),
-- },
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

-- require("sidebar-nvim").setup({
-- files = {
--    icon = "",
--   show_hidden = false,
--   ignored_paths = {"%.git$"}
--   }
-- })
EOF


" au VimEnter,BufRead *.* :lua MiniMap.open()

" Fugitive
" Make diff vertical
set diffopt+=vertical

" Keybindings
nnoremap <leader>gg <cmd>Neogit<cr>
nnoremap <leader>gm <cmd>Gdiffsplit!<cr>
nnoremap <leader>gf <cmd>0Gclog<cr>
nnoremap <leader>gl <cmd>Gclog<cr>
nnoremap <leader>gb <cmd>Git blame<cr>


" Neotest
nnoremap <leader>rr <cmd>lua require("neotest").run.run()<CR>
nnoremap <leader>rf <cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nnoremap <leader>rl <cmd>lua require("neotest").run.run_last()<CR>
nnoremap <leader>rx <cmd>lua require("neotest").run.stop()<CR>
nnoremap <leader>rs <cmd>lua require("neotest").summary.toggle()<CR>
nnoremap <silent>[n <cmd>lua require("neotest").jump.prev()<CR>
nnoremap <silent>]n <cmd>lua require("neotest").jump.next()<CR>

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

  highlight Cursor guifg=white guibg=#0087ff
  highlight iCursor guifg=white guibg=#0087ff
  highlight! link SignColumn LineNr

" Clojure development
let g:iced#nrepl#skip_evaluation_when_buffer_size_is_exceeded = v:true

" Highlight on yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})
augroup END

imap jj <Esc>
