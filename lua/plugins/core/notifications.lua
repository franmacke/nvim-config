return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      progress = { enabled = true },
      override = {
        ["vim.notify"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
