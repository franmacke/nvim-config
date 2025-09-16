local M = {}

M.setup = function()
  require("lspconfig").djlsp.setup({
    cmd = { "djlsp" },
    root_dir = require("lspconfig.util").root_pattern("manage.py", ".git"),
  })
end

return M
