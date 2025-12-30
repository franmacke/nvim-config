return {
  dir = vim.fn.stdpath("config") .. "/lua/plugins/core",
  name = "plantuml-preview",
  ft = "plantuml",
  keys = {
    { "<leader>tp", desc = "PlantUML: Preview PNG" },
    { "<leader>ts", desc = "PlantUML: Preview SVG" },
  },
  config = function()
    -- Preview PNG (opens in external image viewer)
    local function preview_png()
      vim.cmd("write")

      local file = vim.fn.expand("%:p")
      local png = vim.fn.expand("%:r") .. ".png"

      vim.fn.jobstart(
        { "plantuml", "-tpng", file },
        {
          stdout_buffered = true,
          stderr_buffered = true,

          on_exit = function(_, code)
            if code ~= 0 then
              vim.notify(
                "PlantUML failed generating PNG",
                vim.log.levels.ERROR
              )
              return
            end

            vim.schedule(function()
              vim.fn.jobstart({ "xdg-open", png }, { detach = true })
            end)
          end,
        }
      )
    end

    -- Preview SVG (opens in browser)
    local function preview_svg()
      vim.cmd("write")

      local file = vim.fn.expand("%:p")
      local svg = vim.fn.expand("%:r") .. ".svg"

      vim.fn.jobstart(
        { "plantuml", "-tsvg", file },
        {
          stdout_buffered = true,
          stderr_buffered = true,

          on_exit = function(_, code)
            if code ~= 0 then
              vim.notify(
                "PlantUML failed generating SVG",
                vim.log.levels.ERROR
              )
              return
            end

            vim.schedule(function()
              vim.fn.jobstart({ "xdg-open", svg }, { detach = true })
            end)
          end,
        }
      )
    end

    -- View PNG inline in Neovim (requires 3rd/image.nvim plugin)
    -- Uncomment if you have image.nvim installed
    -- local function view_png_inline()
    --   vim.cmd("write")
    --
    --   local file = vim.fn.expand("%:p")
    --   local png = vim.fn.expand("%:r") .. ".png"
    --
    --   vim.fn.jobstart(
    --     { "plantuml", "-tpng", file },
    --     {
    --       stdout_buffered = true,
    --       stderr_buffered = true,
    --
    --       on_exit = function(_, code)
    --         if code ~= 0 then
    --           vim.notify("PlantUML failed generating PNG", vim.log.levels.ERROR)
    --           return
    --         end
    --
    --         vim.schedule(function()
    --           require("image.preview").preview(png)
    --         end)
    --       end,
    --     }
    --   )
    -- end

    -- User commands
    vim.api.nvim_create_user_command("PlantUMLPreviewPNG", preview_png, { desc = "Generate and preview PlantUML PNG" })
    vim.api.nvim_create_user_command("PlantUMLPreviewSVG", preview_svg, { desc = "Generate and preview PlantUML SVG" })

    -- Keymaps
    vim.keymap.set("n", "<leader>tp", preview_png, { desc = "PlantUML: Preview PNG" })
    vim.keymap.set("n", "<leader>ts", preview_svg, { desc = "PlantUML: Preview SVG" })

    -- Uncomment if you have image.nvim installed
    -- vim.keymap.set("n", "<leader>tv", view_png_inline, { desc = "PlantUML: View PNG Inline" })
  end,
}
