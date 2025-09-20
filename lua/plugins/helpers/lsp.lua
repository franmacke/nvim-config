return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls", -- Lua
				"pyright", -- Python
				"html",
				"cssls",
				"ts_ls",
				"yaml-language-server",
				"rust-analyzer",
				"dockerfile-language-server",
				"docker-language-server",
			},
			automatic_installation = true,
		})
	end,
}
