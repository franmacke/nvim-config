-- Mason: Portable package manager for Neovim
return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
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
      local mason_lspconfig = require("mason-lspconfig")

      -- Servidores que queremos instalar automáticamente
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",             -- Lua
          "pylsp",              -- Python
        },
        automatic_installation = true,
      })

      local function setup_servers()
        local servers = {
          "lua_ls",
          "pylsp",
        }

        for _, server in ipairs(servers) do
          local ok, srv = pcall(require, "lsp-servers." .. server)
          if ok and srv.setup then
            srv.setup()
          end
        end
      end

      -- Configurar servidores cuando Mason haya terminado
      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonLspSetup",
        callback = setup_servers,
      })

      -- También configurar después de un pequeño delay por si acaso
      vim.defer_fn(setup_servers, 1000)

      -- Comando para configurar manualmente
      vim.api.nvim_create_user_command("LspSetup", setup_servers, {
        desc = "Manually setup LSP servers",
      })
    end,
  },
}
