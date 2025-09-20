return {
	{
		"franmacke/djortcuts.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			local django_automation = require("djortcuts")
			django_automation.setup()
		end,
		keys = {
			{ "<leader>jr", "<cmd>DjangoRun<cr>", desc = "Django Run Server" },
			{ "<leader>jmg", "<cmd>DjangoMigrate<cr>", desc = "Django Migrate" },
			{ "<leader>jmm", "<cmd>DjangoMakemigrations<cr>", desc = "Django Make Migrations" },
			{ "<leader>js", "<cmd>DjangoShell<cr>", desc = "Django Shell" },
			{ "<leader>ji", "<cmd>DjangoInit<cr>", desc = "Django Init Config" },
			{ "<leader>jt", "<cmd>DjangoTest<cr>", desc = "Django Test" },
			{ "<leader>jc", "<cmd>DjangoCollectstatic<cr>", desc = "Django Collect Static" },
			{ "<leader>jk", "<cmd>DjangoCheck<cr>", desc = "Django Check" },
			{ "<leader>jC", "<cmd>DjangoManagementCommand<cr>", desc = "Django Management Command" },
			{ "<leader>jsa", "<cmd>DjangoStartapp<cr>", desc = "Django Start App" },
			{ "<leader>jsp", "<cmd>DjangoStartproject<cr>", desc = "Django Start Project" },
			{ "<leader>jI", "<cmd>DjangoMakemessages<cr>", desc = "i18n: Make Messages" },
			{ "<leader>jB", "<cmd>DjangoCompilemessages<cr>", desc = "i18n: Build Messages" },
		},
	},
}
