-- ~/.config/nvim/lua/plugins/ui/colorscheme.lua
return {
  { "neanias/everforest-nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        integrations = {
          lsp = true,
          treesitter = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
        },
      })
    end,
  },
}
