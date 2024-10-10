require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "angularls", -- sudo npm install -g @angular/language-service@next typescript @angular/language-server
    -- "emmet",
    "tailwindcss",
    "eslint",
    "html",
    "cssls",
    "jsonls",
    -- "stylua",
    -- 'cspell'
  },
})

-- FIX it
-- require("lsp_lines").setup()

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

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
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- vim.api.nvim_create_autocmd("CursorHold", {
  -- 	buffer = bufnr,
  -- 	callback = function()
  -- 		local opts_ = {
  -- 			focusable = false,
  -- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  -- 			border = "rounded",
  -- 			source = "always",
  -- 			prefix = " ",
  -- 			scope = "cursor",
  -- 		}
  -- 		vim.diagnostic.open_float(nil, opts_)
  -- end,
  -- })
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.flow.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.angularls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.jsonls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
})

nvim_lsp.cssls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
  -- root_dir = require('lspconfig.util').root_pattern('.git'),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
})

nvim_lsp.sourcekit.setup({
  on_attach = on_attach,
})

nvim_lsp.lua_ls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})


require('go').setup({
  lsp_cfg = {
    capabilities = capabilities,
  },
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 2 },
  severity_sort = true,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    priority = 6,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- "K"          vim.lsp.buf.hover            "Hover Info"
-- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "\\q", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol" })

-- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
-- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
-- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
-- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
-- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
-- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"
-- vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
-- vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
-- vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
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
