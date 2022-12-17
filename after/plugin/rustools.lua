local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      enable_format_on_save(client, bufnr)
    end,
  },
})
