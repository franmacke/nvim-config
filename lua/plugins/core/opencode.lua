return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

    -- Leader-based keymaps.
    vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end,
      { desc = "Opencode ask" })
    vim.keymap.set({ "n", "x" }, "<leader>ox", function() require("opencode").select() end,
      { desc = "Opencode action picker" })
    vim.keymap.set({ "n", "t" }, "<leader>ot", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "<leader>og", function() return require("opencode").operator("@this ") end,
      { expr = true, desc = "Opencode range operator" })
    vim.keymap.set("n", "<leader>ogg", function() return require("opencode").operator("@this ") .. "_" end,
      { expr = true, desc = "Opencode line operator" })

    vim.keymap.set("n", "<leader>ou", function() require("opencode").command("session.half.page.up") end,
      { desc = "Opencode half page up" })
    vim.keymap.set("n", "<leader>od", function() require("opencode").command("session.half.page.down") end,
      { desc = "Opencode half page down" })
  end,
}
