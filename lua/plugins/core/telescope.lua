return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    -- Files & Fuzzy Search (<leader>f)
    { "<leader>ff", function() require("telescope.builtin").find_files() end,  desc = "Find Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,   desc = "Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end,     desc = "Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,   desc = "Help Tags" },
    { "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Current Word" },
    { "<leader>fr", function() require("telescope.builtin").resume() end,      desc = "Resume last picker" },
    { "<leader>fo", function() require("telescope.builtin").oldfiles() end,    desc = "Recent Files" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<esc>"] = actions.close,
          },
        },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.7 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.8,
          preview_cutoff = 120,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      }
    })

    telescope.load_extension("fzf")
  end,
}
