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
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.diagnostics.cspell,
    -- null_ls.builtins.code_actions.cspell
  },
})
