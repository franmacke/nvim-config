local themes = { "everforest", "catppuccin" }
local current = 2

vim.cmd.colorscheme(themes[current])

vim.keymap.set("n", "<leader>tt", function()
	current = current % #themes + 1
	vim.cmd.colorscheme(themes[current])
end, { desc = "Toggle Theme" })

vim.opt.termguicolors = true
-- Esto permite que el LSP 'pinte' sobre Treesitter para más detalle
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	undercurl = true,
})
