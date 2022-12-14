---@diagnostic disable: undefined-global

vim.g.mapleader=" "

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


require('plugins')
require('opt')

if vim.fn.exists("g:neovide") then
  vim.g.neovide_scale_factor = 0.85
  vim.g.neovide_fullscreen = true
end


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
  ensure_installed = { "lua", "rust", "javascript", "typescript", "scss",   "yaml", "tsx", "regex", "json", "html", "go", "css", "comment", "elixir", "norg", "http", "haskell", "regex", "vim" },
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


