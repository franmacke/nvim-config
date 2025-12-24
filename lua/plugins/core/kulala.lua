-- lua/plugins/kulala.lua
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  config = function()
    require("kulala").setup({
      global_keymaps = false,
      global_keymaps_prefix = "<leader>k",
      kulala_keymaps_prefix = "",
    })

    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    -- 🌍 Global keymap
    map("n", "<leader>kb", function() require("kulala").scratchpad() end,
      vim.tbl_extend("force", opts, { desc = "Open scratchpad" }))

    -- 📂 Filetype keymaps (solo http/rest)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "http", "rest" },
      callback = function(ev)
        map({ "n", "v" }, "<leader>ks", function() require("kulala").run() end,
          vim.tbl_extend("force", opts, { buffer = ev.buf, desc = "Send request" }))

        map({ "n", "v" }, "<leader>ka", function() require("kulala").run_all() end,
          vim.tbl_extend("force", opts, { buffer = ev.buf, desc = "Send all requests" }))
      end,
    })
  end,
}
