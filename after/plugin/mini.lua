local starter = require("mini.starter")
starter.setup({
  evaluate_single = true,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(10, false),
    starter.sections.recent_files(10, true),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing("all", { "Builtin actions" }),
    starter.gen_hook.padding(3, 2),
  },
})

-- local map = require("mini.map")
-- map.setup({
--   symbols = {
--     encode = map.gen_encode_symbols.shade("1x2"),
--   },
--   integrations = {
--     map.gen_integration.builtin_search(),
--     map.gen_integration.gitsigns(),
--     map.gen_integration.diagnostic(),
--   },
--   window = {
--     width = 12,
--   },
-- })

vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
vim.keymap.set("n", "<Leader>mr", MiniMap.refresh)
vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
vim.keymap.set("n", "<Leader>mm", MiniMap.toggle)


require('mini.cursorword').setup()
