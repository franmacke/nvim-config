-- Base LSP configuration
return {
  "neovim/nvim-lspconfig",
  config = function()
    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Navigation
        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

        -- Documentation
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gK", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Actions
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Diagnostics
        map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
        map("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
        map("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
        map("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

        -- Formatting
        map("<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, "[F]ormat buffer")
      end,
    })

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Create command to check LSP status
    vim.api.nvim_create_user_command("LspDebug", function()
      local clients = vim.lsp.get_active_clients()
      if #clients == 0 then
        vim.notify("No active LSP clients", vim.log.levels.WARN)
      else
        for _, client in ipairs(clients) do
          vim.notify(string.format("LSP: %s (id: %d)", client.name, client.id), vim.log.levels.INFO)
        end
      end
    end, { desc = "Show active LSP clients" })

    -- Create command to check Mason status
    vim.api.nvim_create_user_command("MasonCheck", function()
      local registry = require("mason-registry")
      local installed = registry.get_installed_package_names()
      if #installed == 0 then
        vim.notify("No Mason packages installed", vim.log.levels.WARN)
      else
        vim.notify("Mason packages: " .. table.concat(installed, ", "), vim.log.levels.INFO)
      end
    end, { desc = "Show installed Mason packages" })
  end,
}
