return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern"
  },
  keys = {
    {
      "<leader>w",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    local registry = require("config.keymaps")

    -- Registrar los grupos principales basados en el registro centralizado
    local groups = {}
    for cat_name, cat_info in pairs(registry.categories) do
      table.insert(groups, { cat_info.prefix, group = cat_info.name })
    end

    wk.add(groups)

    -- Workspace keymaps globales
    wk.add({
      mode = { "n", "v" },
      { "<leader>wq", "<cmd>q<cr>", desc = "Quit" },
      { "<leader>ww", "<cmd>w<cr>", desc = "Write" },
    })
  end
}
