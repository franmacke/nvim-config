return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- usa el branch principal
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" }, -- mejor que lazy = false
	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")

		if not status_ok then
			return
		end

		configs.setup({
			ensure_installed = {
				"lua",
				"python",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"htmldjango",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
