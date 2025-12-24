local themes = { "everforest", "catppuccin" }
local current = 1

vim.cmd.colorscheme(themes[current])

vim.keymap.set("n", "<leader>tt", function()
  current = current % #themes + 1
  vim.cmd.colorscheme(themes[current])
end, { desc = "Toggle Theme" })
