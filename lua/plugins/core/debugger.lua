return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    -- Debug controls (<leader>d)
    { "<leader>dt", function() require("dapui").toggle() end,                                                         desc = "Debug: Toggle UI" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                                desc = "Debug: Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,             desc = "Debug: Set Breakpoint with Condition" },
    { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,      desc = "Debug: Set Log Point" },
    { "<leader>dr", function() require("dap").repl.open() end,                                                        desc = "Debug: Open REPL" },
    { "<leader>dL", function() require("dap").run_last() end,                                                         desc = "Debug: Run Last" },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end,                                                 desc = "Debug: Hover Variable" },
    { "<leader>dp", function() require("dap.ui.widgets").preview() end,                                               desc = "Debug: Preview Variable" },
    { "<leader>ds", function()
      local widgets = require("dap.ui.widgets"); widgets.centered_float(widgets.scopes)
    end,                                                                                                              desc = "Debug: Scopes" },

    -- Function keys (standard debug controls - sin leader)
    { "<F5>",       function() require("dap").continue() end,                                                         desc = "Debug: Start/Continue" },
    { "<F10>",      function() require("dap").step_over() end,                                                        desc = "Debug: Step Over" },
    { "<F11>",      function() require("dap").step_into() end,                                                        desc = "Debug: Step Into" },
    { "<F12>",      function() require("dap").step_out() end,                                                         desc = "Debug: Step Out" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configuración de DAP UI
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25,
          position = "bottom",
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
        max_value_lines = 100,
      },
    })

    -- Configuración para Python usando Mason
    require("dap-python").setup(os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python", {
      console = "integratedTerminal",
      include_configs = true,
    })

    -- Eventos automáticos para DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Texto virtual para mostrar valores de variables
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      filter_references_pattern = "<module",
      virt_text_pos = "eol",
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    })

    -- Signos para breakpoints
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition",
      { text = "🟡", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "🟦", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped",
      { text = "➡️", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStoppedLine" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "🔴", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
  end,
}
