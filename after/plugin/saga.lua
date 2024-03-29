-- require("lspsaga").setup({
--   ui = {
--     border = "single",
--   },
-- })
-- local keymap = vim.keymap.set

-- -- svim.opt.numberwidth = 3
-- -- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

-- -- Lsp finder find the symbol definition implement reference
-- -- if there is no implement it will hide
-- -- when you use action in finder like open vsplit then you can
-- -- use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- -- Code action
-- keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- -- Rename
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- -- Peek Definition
-- -- you can edit the definition file in this flaotwindow
-- -- also support open/vsplit/etc operation check definition_action_keys
-- -- support tagstack C-t jump back
-- keymap("n", "gd", vim.lsp.buf.definition, { silent = true })
-- keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- -- Show line diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- -- Show cursor diagnostics
-- keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- -- Diagnostic jump can use `<c-o>` to jump back
-- -- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
-- -- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- -- Only jump to error
-- keymap("n", "[D", function()
--   require("lspsaga.diagnostic").goto_prev({
--     severity = vim.diagnostic.severity.ERROR,
--   })
-- end, { silent = true })
-- keymap("n", "]D", function()
--   require("lspsaga.diagnostic").goto_next({
--     severity = vim.diagnostic.severity.ERROR,
--   })
-- end, { silent = true })
-- -- Outline
-- keymap("n", "<leader>co", "<cmd>LSoutlineToggle<CR>", { silent = true })
-- -- Hover Doc
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
-- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

-- -- Loc list
