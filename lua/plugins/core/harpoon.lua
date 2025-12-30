return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- Project management (<leader>p)
    { "<leader>pa", function() require("harpoon"):list():add() end, desc = "Harpoon Add File" },
    { "<leader>pm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Toggle Menu" },
    { "<leader>p1", function() require("harpoon"):list():select(1) end, desc = "Harpoon Go to 1" },
    { "<leader>p2", function() require("harpoon"):list():select(2) end, desc = "Harpoon Go to 2" },
    { "<leader>p3", function() require("harpoon"):list():select(3) end, desc = "Harpoon Go to 3" },
    { "<leader>p4", function() require("harpoon"):list():select(4) end, desc = "Harpoon Go to 4" },
    { "<leader>p5", function() require("harpoon"):list():select(5) end, desc = "Harpoon Go to 5" },
    { "<leader>p6", function() require("harpoon"):list():select(6) end, desc = "Harpoon Go to 6" },
  },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end,
}
