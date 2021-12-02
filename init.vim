" Mentions
" :CocInstall coc-eslint
" :CocInstall angular lsp
" To be completed...

call plug#begin("~/.vim/plugged")
  " Theme and coloring
  Plug 'morhetz/gruvbox'

  " Git status icons
  Plug 'airblade/vim-gitgutter'

  " Buffer line on the bottom
  Plug 'itchyny/lightline.vim'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " Tab manager, barbar
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " Comment out lines
  " Plug 'tpope/vim-commentary'

  " Git blamer
  Plug 'APZelos/blamer.nvim'

  " Cheat.sh integration
  Plug 'RishabhRD/popfix'
  Plug 'RishabhRD/nvim-cheat.sh'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Indent colorscheme
  "  Plug 'lukas-reineke/indent-blankline.nvim'
  
  " Startup page
  Plug 'glepnir/dashboard-nvim'

call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif


" Settings
let mapleader = "\<Space>"
filetype plugin on
set completeopt=longest,menuone
set mouse=a
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set number
set title
set wrap
setlocal wrap
set encoding=UTF-8

" Remaps
nmap <Leader>p :Rg<CR>
nmap <Leader>h :History<CR>
nmap <Leader>n :NERDTreeToggle<CR>
imap jj <Esc>:w<CR>a
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" Give more space for displaying messages.
set cmdheight=2

" Reduce updatetime
set updatetime=300

" Theme
syntax on
colorscheme gruvbox
set background=dark
set cursorline
set hidden
set list
set listchars=tab:»·,trail:·

" let buffers be clickable
let g:lightline#bufferline#clickable=1
let g:lightline#bfferline#shorten_path=1
let g:lightline#bufferline#min_buffer_count=1

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 200


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" Tabs, bufferline
let bufferline = get(g:, 'bufferline', {})

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" Move to previous/next
nnoremap <silent>    <M-,> :BufferPrevious<CR>
nnoremap <silent>    <M-.> :BufferNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>


" Default value is clap
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

