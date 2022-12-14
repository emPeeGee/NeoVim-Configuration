call plug#begin("~/.vim/plugged")
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' 
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'
  " IDEA: Then exploring new file, get outline an see the file
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go', 'coc-vimlsp']
  Plug 'lewis6991/spellsitter.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-surround'
  " Cheat.sh integration
  " Plug 'RishabhRD/popfix'
  " Plug 'RishabhRD/nvim-cheat.sh'
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'RRethy/vim-illuminate'
  Plug 'liuchengxu/vista.vim'
  Plug 'vimwiki/vimwiki'
  " Plug 'mattn/calendar-vim' Calendar for vim
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'nvim-treesitter/playground'
  Plug 'mbbill/undotree'
  Plug 'ggandor/lightspeed.nvim'
  " Plug 'ggandor/leap.nvim'
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
  " Plug 'nvim-neorg/neorg' TODO: uncomment after NEOVIM 0.8
  " Plug 'rest-nvim/rest.nvim'  TODO: Good concept but doesn't work
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
 " " Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
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
  " Plug 'gorbit99/codewindow.nvim',
call plug#end()


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

" set wildmenu
" set wildmode=list:full

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
" set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" set wildignore+=*/node_modules/*

" Find recursive, not just in current folder
" set path+=**

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" highlight the visual selection after pressing enter.
xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>

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

nmap <silent> gL <cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><cmd>TroubleToggle loclist<CR>
hi! CocInfoSign guifg=LightBlue
" hi! CocErrorSign guibg=none
" hi! CocInfoSign guibg=#353b45
" hi! CocWarningSign guifg=#d1cd66
" Coc settings end

" Enrich go linter
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet']
" Auto imports for go
let g:go_fmt_command = "goimports"
" Show type in bottom of screen
let g:go_auto_type_info = 1


lua << EOF
vim.g.mapleader=" "

if vim.fn.exists("g:neovide") then
  vim.g.neovide_scale_factor = 0.85
  vim.g.neovide_fullscreen = true
end

--" Disable compatibility with vi which can cause unexpected issues.
vim.opt.swapfile = false

--" Reduce updatetime
vim.opt.updatetime=300

--" Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append "c"
vim.opt.completeopt={"longest","menuone"}

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

vim.keymap.set('i', 'jj', '<ESC>', { desc = 'ESC' })
-- " Avoid mswin.vim making Ctrl-v act as paste
vim.keymap.set('', '<C-V>', '<C-V>', {noremap = true})

vim.opt.foldmethod = "indent"
vim.opt.foldlevel=2
vim.opt.foldnestmax=10
vim.opt.foldenable = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.wrap = true

vim.opt.tabstop=2 -- show existing tab with 2 spaces width
vim.opt.shiftwidth=2 -- when indenting with '>', use 2 spaces width
vim.opt.expandtab= true --" On pressing tab, insert 2 spaces
vim.opt.scrolloff=15  
vim.opt.cmdheight=2

-- Show signcolumn before line number
--set signcolumn=yes


vim.opt.cursorline = true -- Highlight cursor line underneath the cursor horizontally.
vim.opt.cursorcolumn = true -- Highlight cursor line underneath the cursor vertically.

vim.opt.spell = false
vim.opt.list = true
-- set listchars=tab:»·,trail:·

vim.opt.colorcolumn={80,120}
vim.opt.ruler = false

--" If you select some lines then press > to indent the lines, the selection is removed. The indentation can be repeated on the same range using ., but if you still want to retain the visual selection after having pressed > or <, you can use these mappings
vim.keymap.set('v', '>', '>gv', { noremap = true })
vim.keymap.set('v', '<', '<gv', { noremap = true })


-- " Open whichkey after 500ms
vim.opt.timeoutlen = 500 

-- " Move the line using alt and jk https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})


function set_horizon() 
  vim.cmd [[colorscheme horizon]]
  vim.cmd [[highlight! link SignColumn LineNr]]
  require('lualine').setup{options = { theme = 'horizon' }}
end


function set_dark_theme()
  vim.g.gruvbox_contrast_dark='soft'
  vim.cmd [[set background=dark]]
  vim.cmd [[colorscheme gruvbox]]
  vim.cmd [[highlight! link SignColumn LineNr]]
  require('lualine').setup{options = { theme = 'gruvbox-material' }}
end

function set_light_theme()
  vim.cmd [[set background=light]]
  vim.cmd [[colorscheme solarized8_high]]
  vim.cmd [[colo solarized8_high]]
  vim.cmd [[highlight! link SignColumn LineNr]]
  vim.cmd [[hi LineNr guibg=NONE]]
  require('lualine').setup{options = { theme = 'gruvbox_light'}}
end



set_dark_theme()


--Theme toggler
vim.keymap.set('n', '<leader>ol', set_light_theme, { desc = 'Set light theme'})
vim.keymap.set('n', '<leader>od', set_dark_theme, { desc = 'Set dark theme'})
vim.keymap.set('n', '<leader>oq', set_horizon, { desc = 'Set horizon theme'})

--" Miscellaneous
vim.keymap.set('n', '<leader>ov',  [[:e $MYVIMRC<CR>]], {desc = 'Open init.vim'} )
vim.keymap.set('n', '<leader>oc',  [[:source $MYVIMRC<CR>]])
vim.keymap.set('n', '<leader>or',  [[:set relativenumber!<Cr>]], { desc = 'Set relative number' })
vim.keymap.set('n', '<leader>ou',  [[:UndotreeToggle<CR>]], { desc = 'Toggle undotree' })
vim.keymap.set('n', '<leader>oi',  [[:PlugInstall<CR>]], { desc = 'PlugInstall' })
vim.keymap.set('n', '<leader>opc', [[:PlugClean<CR>]], { desc = 'PlugClean' })
vim.keymap.set('n', '<leader>ott', [[:Vista!!<cr>]] , {desc = 'Toggle Vista' })
vim.keymap.set('n', '<leader>otc', [[:Vista coc<cr>]] , {desc = 'Toggle Vista coc' })


vim.keymap.set('n', '<leader>tl', '<cmd>TodoLocList<cr>', { desc = 'Toggle Todo list'})
vim.keymap.set('n', '<leader>tq', '<cmd>TodoQuickFix<cr>', {desc = 'Toggle quick fix list'})
vim.keymap.set('n', '<leader>tt', '<cmd>TodoTelescope<cr>', {desc = 'Toggle Todo telescope'})
vim.keymap.set('n', '<leader>nm', '<cmd>NvimTreeFindFileToggle<CR>', {desc = 'Toggle file tree'})
vim.keymap.set('n', '<leader>nn', '<cmd>NvimTreeFocus<cr>', {desc = 'Focus file tree'})



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
        vertical  = {
          preview_height = 0.6,
        },
        height = vim.o.lines,
        width = vim.o.columns,
      },
   },
 }

require('telescope').load_extension('coc')
vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', { desc = ''})
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope<cr>', { desc = ''})
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fv', '<cmd>Telescope grep_string<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_status<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope coc<cr>', { desc = ''})
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<cr>', { desc = ''})

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


local starter = require('mini.starter')
starter.setup({
evaluate_single = true,
items = {
  starter.sections.builtin_actions(),
  starter.sections.recent_files(10, false),
  starter.sections.recent_files(10, true),
},
content_hooks = {
  starter.gen_hook.adding_bullet(),
  starter.gen_hook.indexing('all', { 'Builtin actions' }),
  starter.gen_hook.padding(3, 2),
},
})

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

local hi_scrollbar = "#ABB2B9"
local hi_gitadd = "#2E5049"
local hi_gitadd = "#2E5049"
local hi_gitchange = "#344F69"
local hi_gittext = "#5F3469"
local hi_gitremove = "#693434"

require("scrollbar").setup()
vim.cmd("hi ScrollbarHandle guibg=" .. hi_scrollbar)
vim.cmd("hi ScrollbarCursorHandle guibg=" .. hi_scrollbar)
vim.cmd("hi ScrollbarCursor guibg= " .. hi_scrollbar)
vim.cmd("hi ScrollbarGitAdd guibg=" .. hi_gitadd)
vim.cmd("hi ScrollbarGitAddHandle guibg=" .. hi_gitadd)
vim.cmd("hi ScrollbarGitChange guibg=" .. hi_gittext)
vim.cmd("hi ScrollbarGitChangeHandle guibg=" .. hi_gittext )
vim.cmd("hi ScrollbarGitDelete guibg=" .. hi_gitremove)
vim.cmd("hi ScrollbarGitDeleteHandle guibg=" .. hi_gitremove)


local hi_word = "#6b496e"
vim.cmd("hi def IlluminatedWordText guibg=" .. hi_word)
vim.cmd("hi def IlluminatedWordRead guibg=".. hi_word)
vim.cmd("hi def IlluminatedWordWrite guibg=".. hi_word)

require("scrollbar.handlers.gitsigns").setup()
require("scrollbar.handlers.search").setup()
require("better_escape").setup()

-- require("lsp_lines").setup()

require('treesj').setup({
  use_default_keymaps = false,
  max_join_length = 240
})
vim.keymap.set('n', 'gJ', ":TSJToggle<CR>")

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


-- disable the default highlight group
-- let g:conflict_marker_highlight_group = ''
vim.g.conflict_marker_highlight_group = ''

-- Include text after begin and end markers
vim.g.conflict_marker_begin = "^<<<<<<< .*$"
vim.g.conflict_marker_end   = '^>>>>>>> .*$'

local hi_gitend = "#2F628E"
local hi_gitbegin = "#2F7366"

vim.cmd("highlight ConflictMarkerBegin guibg=" .. hi_gitbegin)
vim.cmd("highlight ConflictMarkerOurs guibg=" .. hi_gitadd)
vim.cmd("highlight ConflictMarkerTheirs guibg=" .. hi_gitchange)
vim.cmd("highlight ConflictMarkerEnd guibg=" .. hi_gitend)
vim.cmd("highlight ConflictMarkerCommonAncestorsHunk guibg=" .. hi_gittext)


vim.cmd("hi DiffAdd gui=none guifg=NONE guibg=" .. hi_gitadd)
vim.cmd("hi DiffChange gui=none guifg=NONE guibg=" .. hi_gitchange)
vim.cmd("hi DiffText gui=none guifg=NONE guibg=" .. hi_gitend)
vim.cmd("hi DiffDelete gui=none guifg=NONE guibg=" .. hi_gitremove)
vim.cmd("hi DiffviewDiffAddAsDelete gui=none guifg=NONE guibg=" .. hi_gitremove)

vim.cmd("hi GitSignsChangeInline gui=none guifg=NONE guibg=" .. hi_gittext)
vim.cmd("hi GitSignsAddInline gui=none guifg=NONE guibg=" .. hi_gittext)
vim.cmd("hi GitSignsDeleteInline gui=none guifg=NONE guibg=" .. hi_gittext)


vim.cmd [[hi MatchParen guibg=magenta guifg=white]]


-- TODO: Better config of wilder
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
wilder.set_option('pipeline', {wilder.branch(wilder.cmdline_pipeline({debounce=300}))})
wilder.set_option('use_python_remote_plugin', 0)

-- require("drop").setup({
  -- theme = "snow", -- can be one of rhe default themes, or a custom theme
--   max = 100, -- maximum number of drops on the screen
  -- interval = 150, -- every 150ms we update the drops
  -- screensaver = 1000 * 60 * 2, -- show after 5 minutes. Set to false, to disable
 --  filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
-- })
--  require("zone").setup()
require("project_nvim").setup {
  detection_methods = {"patters"}
}
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

-- local codewindow = require('codewindow')
-- codewindow.setup({
  --minimap_width = 10,
  --width_multiplier = 8,
  --auto_enable = true,
  -- exclude_filetypes = { 'NvimTree', 'starter' },
  -- window_border = 'single'
--})
-- codewindow.apply_default_keybinds()


vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>gm', '<cmd>Gdiffsplit!<cr>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>go', '<cmd>DiffviewOpen<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>gl', '<cmd>DiffviewFileHistory<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>gf', '<cmd>DiffviewFileHistory %<CR>', { noremap = true, desc = ''})


vim.keymap.set('n', '<leader>rr', '<cmd>lua require("neotest").run.run()<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>rf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>rl', '<cmd>lua require("neotest").run.run_last()<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>rx', '<cmd>lua require("neotest").run.stop()<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>rs', '<cmd>lua require("neotest").summary.toggle()<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<silent>[n', '<cmd>lua require("neotest").jump.prev()<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<silent>]n', '<cmd>lua require("neotest").jump.next()<CR>', { noremap = true, desc = ''})
vim.keymap.set('n', '<leader>tc', ':CoverageToggle<CR>', { noremap = true, desc = ''})

vim.keymap.set('n', '<Leader>ob', ':lua print(vim.bo.filetype)<CR>', { desc = "Current buffer type" })
vim.keymap.set('n', '[d', ':Bdelete<CR>', { desc = "Bdelete", silent = true })
EOF

" Handy for angular https://www.reddit.com/r/vim/comments/fedjzm/open_angular_counterpart_html_or_ts_files/
" Oxocarbon is good theme
" quickfix window
