return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

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

    -- cargar extensión fzf
    telescope.load_extension("fzf")

    -- Keymaps principales
    vim.keymap.set("n", "<leader><CR>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>e", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Current Word" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last picker" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Recent Files" })
  end,
}
