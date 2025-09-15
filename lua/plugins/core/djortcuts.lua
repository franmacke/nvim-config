return {
  {
    "franmacke/djortcuts.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local django_automation = require("djortcuts")
      django_automation.setup()
    end,
    keys = {
      { "<leader>jr",  "<cmd>DjangoRun<cr>",               desc = "Django Run Server" },
      { "<leader>jmg", "<cmd>DjangoMigrate<cr>",           desc = "Django Migrate" },
      { "<leader>jmm", "<cmd>DjangoMakemigrations<cr>",    desc = "Django Make Migrations" },
      { "<leader>js",  "<cmd>DjangoShell<cr>",             desc = "Django Shell" },
      { "<leader>ji",  "<cmd>DjangoInit<cr>",              desc = "Django Init Config" },
      { "<leader>jt",  "<cmd>DjangoTest<cr>",              desc = "Django Test" },
      { "<leader>jc",  "<cmd>DjangoCollectstatic<cr>",     desc = "Django Collect Static" },
      { "<leader>jk",  "<cmd>DjangoCheck<cr>",             desc = "Django Check" },
      { "<leader>jC",  "<cmd>DjangoManagementCommand<cr>", desc = "Django Management Command" },
    },
    dependencies = {
      "folke/which-key.nvim",
      opts = {
        spec = {
          { "<leader>j", group = "djortcuts", icon = { icon = "⚡" } },
          { "<leader>jm", group = "Migrations" },
        },
      },
    },
  },
}
