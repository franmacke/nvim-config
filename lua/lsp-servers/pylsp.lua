local M = {}

M.setup = function()
  local lspconfig = require("lspconfig")
  lspconfig.pylsp.setup({
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = true },
          pycodestyle = { enabled = true },
          pylint = { enabled = true },
          mccabe = { enabled = true },
          yapf = { enabled = true },
          black = { enabled = true },
        },
      },
    },
    on_attach = function(client, bufnr)
      -- Enable formatting on save if supported
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })
end

return M
