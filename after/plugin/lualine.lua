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
    component_separators = { left = "|", right = "|" },
    disabled_filetypes = { winbar = { "packer", "NvimTree" } },
  },
  extensions = { "nvim-tree" },
  sections = {
    --lualine_b = {'branch', 'diff', 'diagnostics'}, FIX: is not working https://github.com/nvim-lualine/lualine.nvim/issues/799
    lualine_b = {
      "branch",
      { "diff", source = diff_source },
      "diagnostics",
    },
    lualine_c = {},
    lualine_y = { battery },
    lualine_x = { "searchcount" },
    lualine_z = { time },
  },

  winbar = {
    lualine_a = {},
    lualine_b = {
      {
        "filetype",
        colored = true, -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
        icon = { align = "right" }, -- Display filetype icon on the right hand side
      },
    },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {},
    lualine_y = { "location", { "progress" } },
    lualine_z = { "filesize" },
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
