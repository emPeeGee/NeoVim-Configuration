call plug#begin("~/.vim/plugged")
  " Theme and coloring
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'

  " Ranger
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
        
  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' 

  " Minimap
  Plug 'wfxr/minimap.vim' 

  " Start screen
  Plug 'mhinz/vim-startify'

   "Autocomplete pairs
  "Plug 'jiangmiao/auto-pairs'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Git blamer
  Plug 'APZelos/blamer.nvim'

  " Buffer line on the bottom
  Plug 'itchyny/lightline.vim'

  " Auto comment lines
  Plug 'preservim/nerdcommenter'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs']
  
  " Tests
  Plug 'janko-m/vim-test' 

  " Which key
  Plug 'liuchengxu/vim-which-key'

  " Comment out lines
  Plug 'tpope/vim-commentary'

  " Cheat.sh integration
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-cheat.sh'
  
  " Icons for vim
  Plug 'ryanoasis/vim-devicons'

  " Select multiple same items
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Cheat.sh integration
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-cheat.sh'

  " Go lang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " File tree  
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

  " Highlight word under curson
  Plug 'RRethy/vim-illuminate'

  " An always-on highlight for a unique character in every word on a line to help you use f, F
  Plug 'unblevable/quick-scope'

  " Jump anywhere
  Plug 'phaazon/hop.nvim'

  " Spell checker
  "Plug 'kamykn/spelunker.vim'

  " A class outline viewer for Vim
  " Required ctags to be installed
  Plug 'preservim/tagbar'

  " I guess something like org-mode
  Plug 'vimwiki/vimwiki'

  " Color Highlight
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " Calendar for vim
  Plug 'mattn/calendar-vim'

  " Speed up folding
  "Plug 'Konfekt/FastFold'

  " Debugging
  Plug 'puremourning/vimspector'

  " Tpope pairs of mappings
  Plug 'tpope/vim-unimpaired'

  " Treesitter for highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Themes
  Plug 'Th3Whit3Wolf/space-nvim' " Good light background
  Plug 'lifepillar/vim-solarized8'
call plug#end()


" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256 " https://superuser.com/questions/311370/solarized-colors-in-vim-dont-seem-to-be-working-for-me
" Lightline Remove redundant statusline -- MODE --
set noshowmode

let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename' , 'modified'],
      \             ['gitgutterstatus'],
      \             ['venv', 'readonly']],
      \   'right': [['lineinfo'], ['percent'], ['filetype']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'venv': 'virtualenv#statusline',
      \   'filename': 'LightlineFilename',
      \   'gitgutterstatus': 'GitGutterStatus',
      \ },
      \ }

" Get file name from git root
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Show additions, removals and changes of current buffer in lightline
function! GitGutterStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


function! SetDarkTheme()
  let g:gruvbox_contrast_dark='soft'
  set background=dark
  colorscheme gruvbox

  highlight Cursor guifg=white guibg=reverse
  highlight iCursor guifg=white guibg=reverse
  hi illuminatedWord guifg=white guibg=grey50

  let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
endfunction

function! SetLightTheme()
  set background=light
  "autocmd vimenter * ++nested colorscheme solarized8_high
  colorscheme solarized8_high " Looks good but there are 4 themes but actually they look the same"

  highlight Cursor guifg=white guibg=blue
  highlight iCursor guifg=white guibg=blue
  set guicursor=n-v-c:block-Cursor
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
  hi LineNr  guibg=NONE
  hi illuminatedWord guifg=white guibg=grey50

  let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }
endfunction


" Theme
syntax on

if strftime("%H") < 12
  call SetDarkTheme()
else
  call SetLightTheme()
endif



set cursorline   " highlight current line
set cursorcolumn " highlight current column

set list
set listchars=tab:»·,trail:·
" TODO: understand above 2 lines



" NeoVim default settings
" Settings
let mapleader = "\<Space>"
let g:mapleader="\<Space>"

filetype plugin on
set completeopt=longest,menuone
set mouse=a
set nocompatible
set noswapfile
set number
set title
set wrap
setlocal wrap
filetype plugin indent on
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
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Make nvim use global clipboard
set clipboard=unnamedplus

" disable default spell checker
set nospell

" Show signcolumn before line number
set signcolumn=yes

" hey yoi take 
" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" highlight the visual selection after pressing enter.
xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>

"  imap jj <Esc>:w<CR>a
imap jj <Esc>

" Neovim non plugin keybindings
" Buffer maps
nnoremap <Leader>bh :bprevious<CR>
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bk :bfirst<CR>
nnoremap <Leader>bj :blast<CR>
nnoremap <Leader>bx :bd<CR>
nnoremap <Leader>bq :ls<CR>

" Move the line using alt and jk https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>fcv :vsp $MYVIMRC<CR>


nnoremap <leader>ml <cmd>:call SetLightTheme()<cr>
nnoremap <leader>md <cmd>:call SetDarkTheme()<cr>

" Coc config

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ap  <Plug>(coc-codeaction-selected)
nmap <leader>ap  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Coc settings end


" WhickKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" Open whichkey after 500ms
set timeoutlen=500


" Vim-go -> Go setup
" Highlight variable with same name when cursor is on them
let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

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
let g:blamer_enabled = 1
let g:blamer_delay = 1000


" Ranger
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1 

" Keybindings 
nmap <Leader>r :Ranger<CR>


" Minimap
let g:minimap_width = 10
let g:minimap_auto_start = 0 " Disable autostart
let g:minimap_auto_start_win_enter = 0
let g:minimap_git_colors = 1 " Use with git 

" Keybindings
nnoremap <leader>mm :MinimapToggle<CR>
nnoremap <leader>mr :MinimapRescan<CR>
nnoremap <leader>ms :MinimapRefresh<CR>


" Telescope
" Keybindings
nnoremap <leader>tt <cmd>Telescope<cr>
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>ts <cmd>Telescope grep_string<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

" Illuminate
" Underline word under cursor instead of backgroud change
hi illuminatedWord guifg=white guibg=grey50


" Hop
" Setup hop
:lua require'hop'.setup()

" Keybindings
nnoremap <leader><leader>w <cmd>HopWord<cr>
nnoremap <leader><leader>p <cmd>HopPattern<cr>
nnoremap <leader><leader>g <cmd>HopChar1<cr>
nnoremap <leader><leader>h <cmd>HopChar2<cr>
nnoremap <leader><leader>l <cmd>HopLine<cr>
nnoremap <leader><leader>k <cmd>HopLineStart<cr>


" Quick-scope
let g:qs_delay = 150
let g:qs_filetype_blacklist = ['startify']
let g:qs_buftype_blacklist = ['nofile']

 "Keybindings
"nmap <leader>sq <plug>(QuickScopeToggle)
"xmap <leader>sq <plug>(QuickScopeToggle)


" CHADTree
" set width of the file tree
let g:chadtree_settings = {"view.width": 30}

" Autoclose chadtree if it the last window left
autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif

" Keybindings
nnoremap <leader>nn <cmd>CHADopen<cr>
nnoremap <leader>nf <cmd>CHADopen --always-focus<cr>
nnoremap <leader>nm <cmd>:CHADopen --nofocus<cr>
nnoremap <leader>nr <cmd>:CHADopen --version-ctl<cr>



" Tagbar
" Keybindings
nnoremap <leader>to <cmd>TagbarToggle<cr>


" GitGutter
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900
highlight GitGutterChange guifg=#bbbb00
highlight GitGutterDelete guifg=#ff2222
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

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "rust", "javascript", "typescript", "scss",   "yaml", "tsx", "regex", "json", "html", "go", "css", "comment" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF

