-- Mason: Portable package manager for Neovim
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",     -- Update packages on install/update
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Setup mason-lspconfig
      require("mason-lspconfig").setup({
        -- Automatically install these servers
        ensure_installed = {
          "lua_ls",           -- Lua
          "pylsp",            -- Python
        },

        -- Automatically enable installed servers
        automatic_enable = false,         -- We'll set them up manually
      })

      -- Wait for Mason to be ready, then configure servers
      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonLspSetup",
        callback = function()
          -- Configure the servers after Mason has installed them
          require("lsp-servers.lua_ls").setup()
          require("lsp-servers.pylsp").setup()
        end,
      })

      -- Also set them up after a delay to be safe
      vim.defer_fn(function()
        require("lsp-servers.lua_ls").setup()
        require("lsp-servers.pylsp").setup()
      end, 1000)       -- 1 second delay

      -- Command to manually trigger server setup
      vim.api.nvim_create_user_command("LspSetup", function()
        require("lsp-servers.lua_ls").setup()
        require("lsp-servers.pylsp").setup()
        vim.notify("LSP servers configured", vim.log.levels.INFO)
      end, { desc = "Manually setup LSP servers" })
    end,
  },
}
