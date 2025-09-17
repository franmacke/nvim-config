return {
	"nvim-telescope/telescope-ui-select.nvim",
	lazy = false,
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- podes customizar acá el aspecto
					}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
