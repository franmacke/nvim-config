return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- LSP Attach - keymaps buffer-locals
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        -- LSP Navigation (sin leader - atajos globales)
        opts.desc = "Go to definition"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- Code Actions (<leader>c*)
        opts.desc = "Show available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

        -- Diagnostics (<leader>cd*) - moved here from <leader>d* (now used by Debug)
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        -- Diagnostic navigation (sin leader)
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        -- LSP Restart
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>cR", ":LspRestart<CR>", opts)
      end,
    })

    -- Enable autocompletion for all LSP servers
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Diagnostic config
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      virtual_text = {
        spacing = 2,
        source = "if_many",
        format = function(d)
          local sev = vim.diagnostic.severity
          local prefix = ({ [sev.ERROR] = "E", [sev.WARN] = "W", [sev.INFO] = "I", [sev.HINT] = "H" })[d.severity]
              or ""
          local code = d.code or (d.user_data and d.user_data.lsp and d.user_data.lsp.code)
          if code then
            return string.format("%s: %s (%s)", prefix, d.message, code)
          end
          return string.format("%s: %s", prefix, d.message)
        end,
      },
      severity_sort = true,
      update_in_insert = false,
    })

    -- Global LSP config
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- LSP Servers configurations
    vim.lsp.config("emmet_ls", {
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    vim.lsp.config("eslint", {
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "self",
          },
          diagnostics = {
            enable = true,
            enableExperimental = true,
          },
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
          inlayHints = {
            chainingHints = true,
            parameterHints = true,
            typeHints = true,
          },
        },
      },
    })
  end,
}
