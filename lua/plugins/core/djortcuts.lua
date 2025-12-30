return {
  {
    "franmacke/djortcuts.nvim",
    lazy = true,
    priority = 1000,
    keys = {
      -- Core Django commands (<leader>j)
      { "<leader>jr", "<cmd>DjangoRun<cr>", desc = "Django: Run Server" },
      { "<leader>js", "<cmd>DjangoShell<cr>", desc = "Django: Shell" },
      { "<leader>jt", "<cmd>DjangoTest<cr>", desc = "Django: Test" },
      { "<leader>ji", "<cmd>DjangoInit<cr>", desc = "Django: Init Config" },

      -- Migrations (<leader>jm*)
      { "<leader>jmm", "<cmd>DjangoMakemigrations<cr>", desc = "Django: Make Migrations" },
      { "<leader>jma", "<cmd>DjangoMigrate<cr>", desc = "Django: Apply Migrations" },

      -- App/Project management (<leader>ja*, <leader>jp*)
      { "<leader>ja", "<cmd>DjangoStartapp<cr>", desc = "Django: Start App" },
      { "<leader>jp", "<cmd>DjangoStartproject<cr>", desc = "Django: Start Project" },

      -- Static files & checks (<leader>jc*, <leader>jk*)
      { "<leader>jc", "<cmd>DjangoCollectstatic<cr>", desc = "Django: Collect Static" },
      { "<leader>jk", "<cmd>DjangoCheck<cr>", desc = "Django: Check Project" },

      -- Management commands (<leader>jj)
      { "<leader>jj", "<cmd>DjangoManagementCommand<cr>", desc = "Django: Management Command" },

      -- i18n (internationalization) (<leader>jx*)
      { "<leader>jxm", "<cmd>DjangoMakemessages<cr>", desc = "Django i18n: Make Messages" },
      { "<leader>jxc", "<cmd>DjangoCompilemessages<cr>", desc = "Django i18n: Compile Messages" },
    },
    config = function()
      local django_automation = require("djortcuts")
      django_automation.setup()
    end,
  },
}
