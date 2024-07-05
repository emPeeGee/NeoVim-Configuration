local bottom_style = {
  theme = "ivy",
  hidden = true,
  border = false,
  layout_config = {
    height = 15,
    width = vim.o.columns,
    preview_width = 0,
    prompt_position = "top",
  },
}

require("telescope").setup({
  pickers = {
    find_files = bottom_style,
    git_status = bottom_style,
    buffers = bottom_style,
    oldfiles = bottom_style,
  },
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
    border = true,
    live_grep = {
      debounce = 250,
    },
    file_ignore_patterns = {
      "_build",
      "__localization__",
      "packer_compiled.lua",
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        preview_height = 0.6,
      },
      height = vim.o.lines,
      width = vim.o.columns,
    },
  },
})

require("project_nvim").setup({
  detection_methods = { "patters" },
})

require("telescope").load_extension("projects")

-- require('telescope').load_extension('coc')
-- vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>fv", "<cmd>Telescope grep_string<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "" })
-- vim.keymap.set('n', '<leader>fc', '<cmd>Telescope coc<cr>', { desc = ''})
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "" })

local tl = require("telescope.builtin")

<<<<<<< HEAD
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope<cr>", { desc = "[F]ind [F]iles" })
||||||| parent of eefc887 (feat: new keymaps for telescope)
=======
vim.keymap.set("n", "<leader>ff", tl.find_files, { desc = "[F]ind [F]iles" })
>>>>>>> eefc887 (feat: new keymaps for telescope)
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "[F]ind in [T]elescope" })
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "[F]ind [G]it" })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "[F]ind [P]rojects" })

vim.keymap.set("n", "<leader>fg", tl.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "g/", tl.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader><leader>", tl.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>?", tl.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>fb", tl.buffers, { desc = "[F}ind existing [b]uffers" })
vim.keymap.set("n", "<leader>,", tl.buffers, { desc = "[,] Find existing buffers" })
vim.keymap.set("n", "<leader>fh", tl.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fw", tl.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fd", tl.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>/", function()
  tl.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer]" })

local function find_org_files()
  local opts = {
    cwd = "~/AppData/Roaming/org",
  }
  require("telescope.builtin").find_files(opts)
end

vim.keymap.set("n", "<leader>fo", find_org_files, { desc = "[F]ind [O]rg" })

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup({
  extensions = {
    file_browser = {
      cwd_to_path = true,
      -- theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

vim.keymap.set("n", "<leader>f.", ":Telescope file_browser path=%:p:h<CR>", { desc = "Find Here" })
vim.keymap.set("n", "<leader>fr", ":Telescope file_browser<CR>", { desc = "[F]ind from [R]oot" })
