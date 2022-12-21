local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        "--column-width",
        "100",
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
      },
    }),
    -- null_ls.builtins.diagnostics.eslint, f
    null_ls.builtins.diagnostics.cspell.with({
      diagnostics_postprocess = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
          diagnostic.severity = vim.diagnostic.severity.HINT
        end
      end,
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      diagnostic_config = {
        -- see :help vim.diagnostic.config()
        underline = false,
        virtual_text = false,
        update_in_insert = false,
        severity_sort = true,
        signs = { enable = true, priority = 11 },
      },
    }),
    null_ls.builtins.code_actions.cspell,
  },
})
--  aption
