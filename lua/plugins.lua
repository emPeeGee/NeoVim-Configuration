-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'morhetz/gruvbox'
  use 'lifepillar/vim-solarized8'
  use 'ryanoasis/vim-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- use 'fannheyward/telescope-coc.nvim'
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
  -- " use 'mrjones2014/legendary.nvim'
  -- " use 'sidebar-nvim/sidebar.nvim' TODO: Good concept
  use 'nvim-lualine/lualine.nvim'
  use 'ntk148v/vim-horizon'
  use 'echasnovski/mini.nvim'
  use 'bennypowers/nvim-regexplainer'
  use 'andythigpen/nvim-coverage'
  use 'sindrets/diffview.nvim'
  use 'rhysd/conflict-marker.vim'
  use 'famiu/bufdelete.nvim'
  use 'petertriho/nvim-scrollbar'
  use 'max397574/better-escape.nvim'
  -- use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  -- use 'Maan2003/lsp_lines.nvim'
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
  use 'j-hui/fidget.nvim'
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- vim.g['coc_global_extensions'] = ({'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-angular', 'coc-pairs', 'coc-snippets', 'coc-clojure', 'coc-elixir', 'coc-spell-checker', 'coc-lua', 'coc-rust-analyzer', 'coc-go'})
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use { 'hrsh7th/cmp-buffer' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use 'glepnir/lspsaga.nvim'
  use { 'hrsh7th/cmp-path' }


  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'simrat39/rust-tools.nvim'


  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "sumneko_lua",
      "tsserver",
      "emmet",
      "tailwindcss",
      "eslint",
      'html',
      'cssls',
    }
  })

  require "fidget".setup {}
  local luasnip = require('luasnip')
  -- require("lsp_lines").setup()


  local status, nvim_lsp = pcall(require, "lspconfig")
  if (not status) then return end

  local protocol = require('vim.lsp.protocol')

  local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
  local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup_format,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --   buffer = bufnr,
    --   callback = function()
    --     local opts_ = {
    --       focusable = false,
    --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --       border = 'rounded',
    --       source = 'always',
    --       prefix = ' ',
    --       scope = 'cursor',
    --     }
    --     vim.diagnostic.open_float(nil, opts_)
    --   end
    -- })
  end

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }

  -- Set up completion using nvim_cmp with LSP source
  local capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  nvim_lsp.flow.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }

  nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }

  nvim_lsp.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }

  nvim_lsp.tsserver.setup {
    -- root_dir = require('lspconfig.util').root_pattern('.git'),
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      enable_format_on_save(client, bufnr)
    end,
    -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    -- cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities
  }

  nvim_lsp.sourcekit.setup {
    on_attach = on_attach,
  }

  nvim_lsp.sumneko_lua.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      enable_format_on_save(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },

        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false
        },
      },
    },
  }

  -- local tw_highlight = require('tailwind-highlight')
  -- nvim_lsp.tailwindcss.setup({
  --   on_attach = function(client, bufnr)
  --     tw_highlight.setup(client, bufnr, {
  --       single_column = false,
  --       mode = 'background',
  --       debounce = 200,
  --     })
  --   end,
  --   capabilities = capabilities
  -- })


  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4 },
    severity_sort = true,
  })

  -- Show line diagnostics automatically in hover window
  vim.o.updatetime = 250
  -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


  vim.diagnostic.config({
    update_in_insert = false,
    float = {
      source = "always", -- Or "if_many"
    },

  })

  -- Add additional capabilities supported by nvim-cmp
  -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- local lsp_attach = function(client, buf)
  -- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
  -- or a plugin like which-key.nvim
  -- <lhs>        <rhs>                        <desc>
  -- "K"          vim.lsp.buf.hover            "Hover Info"
  -- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
  -- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
  -- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
  -- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
  -- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
  -- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
  -- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
  -- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
  -- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"
  -- vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  -- vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
  -- end

  --   sources = {
  --     {name = 'path'},
  --     {name = 'nvim_lsp', keyword_length = 2},
  --     {name = 'buffer', keyword_length = 3},
  --     {name = 'luasnip', keyword_length = 2},
  --   },
  --   formatting = {
  --     fields = {'menu', 'abbr', 'kind'},
  --     format = function(entry, item)
  --       local menu_icon = {
  --         nvim_lsp = 'λ',
  --         luasnip = '⋗',
  --         buffer = 'Ω',
  --         path = '🖫',
  --       }

  --       item.menu = menu_icon[entry.source.name]
  --       return item
  --     end,
  --   },
  -- }
  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  -- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'eslint' }
  -- for _, lsp in ipairs(servers) do
  --   lspconfig[lsp].setup {
  --     -- on_attach = my_custom_on_attach,
  --   capabilities = capabilities,
  --   flags = {
  --     debounce_text_changes = 150,
  --   },
  --   on_attach = function(client, bufnr)
  --     vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  --   end
  --   }
  -- end
  -- local lspconfig = require('lspconfig')

  -- lspconfig.util.default_config = vim.tbl_deep_extend(
  --   'force',
  --   lspconfig.util.default_config,
  --   lsp_defaults
  -- )
  --

  local status, cmp = pcall(require, "cmp")
  if (not status) then return end

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
    }),
  })

  vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]


  local null_ls = require("null-ls")


  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.diagnostics.eslint,
      -- null_ls.builtins.diagnostics.cspell,
      -- null_ls.builtins.code_actions.cspell
    },
  })

  local keymap = vim.keymap.set
  local saga = require('lspsaga')

  saga.init_lsp_saga()

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

  -- Code action
  keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

  -- Rename
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

  -- Peek Definition
  -- you can edit the definition file in this flaotwindow
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back
  keymap("n", "gd", vim.lsp.buf.definition, { silent = true })
  keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

  -- Show line diagnostics
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

  -- Show cursor diagnostics
  keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

  -- Diagnostic jump can use `<c-o>` to jump back
  keymap("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  keymap("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

  -- Only jump to error
  keymap("n", "[G", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  keymap("n", "]G", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  -- Outline
  keymap("n", "<leader>co", "<cmd>LSoutlineToggle<CR>", { silent = true })
  -- Hover Doc
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

  cmp.setup {
    config = {
      performance = {
        debounce = 30,
        throttle = 15,
        fetching_timeout = 200,
      }
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  }

  local rt = require("rust-tools")

  rt.setup({
    server = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
      end,
    },
  })

end)


-- prettierd is pretty fast
-- root is delivery not acc in proj
-- disable saga scroll
-- saga floting window still bug
-- cspell, auto pairs
-- \ as key
-- tab completion
