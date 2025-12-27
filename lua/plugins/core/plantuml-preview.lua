return {
  dir = vim.fn.stdpath("config") .. "/lua/plugins/core",
  name = "plantuml-preview",
  ft = "plantuml",

  config = function()
    local function preview_plantuml()
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

            -- abrir SOLO cuando terminó
            vim.schedule(function()
              vim.fn.jobstart({ "xdg-open", png }, { detach = true })
            end)
          end,
        }
      )
    end

    vim.api.nvim_create_user_command(
      "PlantUMLPreview",
      preview_plantuml,
      { desc = "Generate and preview PlantUML PNG" }
    )

    vim.keymap.set(
      "n",
      "<leader>pp",
      preview_plantuml,
      { desc = "PlantUML Preview" }
    )
  end,
}
