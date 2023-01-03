local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

require("battery").setup({})
local battery = function()
  return require("battery").get_status_line()
end

local time = function()
  return os.date("%H:%M")
end

require("lualine").setup({
  options = {
    globalstatus = true,
  },
  extensions = { "nvim-tree" },
  sections = {
    --lualine_b = {'branch', 'diff', 'diagnostics'}, FIX: is not working https://github.com/nvim-lualine/lualine.nvim/issues/799
    lualine_b = {
      "branch",
      { "diff", source = diff_source },
      "diagnostics",
    },
    lualine_x = { battery },
    lualine_z = { time },
  },
})
