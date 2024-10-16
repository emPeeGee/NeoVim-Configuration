vim.g.mapleader = " "

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- require("neodev").setup()
require("plugins")
require("opt")
require("colorscheme")
require("remap")

_G.open_telescope = function()
	local first_arg = vim.v.argv[2]
	if first_arg and vim.fn.isdirectory(first_arg) == 1 then
		vim.g.loaded_netrwPlugin = 1
		require("telescope.builtin").find_files({ search_dirs = { first_arg } })
	end
end

-- vim.api.nvim_exec(
--   [[
-- augroup TelescopeOnEnter
--     autocmd!
--     autocmd VimEnter * lua open_telescope()
-- augroup END
-- ]],
--   false
-- )

if vim.fn.exists("g:neovide") then
	vim.g.neovide_scale_factor = 0.85
	vim.g.neovide_fullscreen = true
end

-- require("hlslens").setup()
-- require("nvim-surround").setup({})

-- TODO: ???
-- local ccc = require("ccc")
-- ccc.setup({
--   highlighter = {
--     auto_enable = true,
--   },
-- })




-- require("fidget").setup({})
-- require("luasnip")
-- require("hlargs").setup()

-- " Enrich go linter
vim.g.go_metalinter_autosave = 1
vim.g.go_metalinter_autosave_enabled = { "golint", "govet" }
-- " Auto imports for go
vim.g.go_fmt_command = "goimports"
-- " Show type in bottom of screen
vim.g.go_auto_type_info = 1

-- automatically update links on read diary
vim.cmd([[augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end ]])

vim.cmd([[hi MatchParen guibg=magenta guifg=white]])
-- require("lsp_signature").setup()
-- vim.opt.numberwidth = 3
-- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

-- require('mini.indentscope').setup()

-- require("orgmode").setup({
-- 	org_agenda_files = "~/AppData/Roaming/org/*",
-- 	org_default_notes_file = "~/AppData/Roaming/org/*",
-- 	org_capture_templates = {

-- 		T = {
-- 			description = "Todo",
-- 			template = "* TODO %?\n %u",
-- 			target = "~/AppData/Roaming/org/todo.org",
-- 		},
-- 		e = "English",
-- 		ee = {
-- 			description = "English classes",
-- 			template = "** Lesson nr. %? %t",
-- 			target = "~/AppData/Roaming/org/english.org",
-- 			headline = "Lessons",
-- 		},
-- 	},
-- })

-- require("orgmode").setup_ts_grammar()


-- require 'go'.setup({
-- 	goimport = 'gopls', -- if set to 'gopls' will use golsp format
-- 	gofmt = 'gopls', -- if set to gopls will use golsp format
-- 	max_line_len = 120,
-- 	tag_transform = false,
-- 	test_dir = '',
-- 	comment_placeholder = '   ',
-- 	lsp_cfg = true, -- false: use your own lspconfig
-- 	lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
-- 	lsp_on_attach = true, -- use on_attach from go.nvim
-- 	dap_debug = true,
-- })

-- TODO: Lazy git
vim.api.nvim_create_user_command("PathCopyAbs", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("PathCopyRel", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- // nav - Delivery summary, instead of
-- clicks label
--  TODO: After search, you can move results in quickfix
