call plug#begin("~/.vim/plugged")
  " Theme and coloring
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'

  " Highlight jsx
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'

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
  
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

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

  " File Search
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  "Plug 'junegunn/fzf.vim'

  " Indent colorscheme
  "  Plug 'lukas-reineke/indent-blankline.nvim'
  
  " Show error hints and highlights
  "Plug 'vim-syntastic/syntastic'

  " Select multiple same items
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Markdown
  " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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
  Plug 'kamykn/spelunker.vim'
call plug#end()

" quick-scope
" Change quick-scope colors, should be before setting colorscheme
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif


" Theme
syntax on
let g:gruvbox_contrast_dark='soft'
set background=dark
colorscheme gruvbox

set cursorline
" :set hidden
set list
set listchars=tab:»·,trail:·


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
set shiftwidth=4
" On pressing tab, insert 2 spaces
set expandtab

" Folding auto mode
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

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

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" Coc config
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>ts <cmd>Telescope grep_string<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>


" Illuminate
" Underline word under cursor instead of backgroud change
hi illuminatedWord cterm=underline gui=underline


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


" quick-scope
" Change delay
let g:qs_delay = 150
let g:qs_filetype_blacklist = ['Ranger', 'startify']
let g:qs_buftype_blacklist = ['Ranger', 'nofile']

" Keybindings
nmap <leader>sq <plug>(QuickScopeToggle)
xmap <leader>sq <plug>(QuickScopeToggle)


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


" Lightline
" Remove redundant statusline -- MODE --
set noshowmode

let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename' , 'modified'],
      \             ['venv', 'readonly']],
      \   'right': [['lineinfo'], ['percent'], ['filetype']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'venv': 'virtualenv#statusline',
      \   'filename': 'LightlineFilename',
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


" Unknown at this moment
" open new split panes to right and below
set splitright
set splitbelow


" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" nmap <Leader>p :Rg<CR>
nmap <Leader>h :History<CR>


nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
