return {
  "aklt/plantuml-syntax",
  ft = "plantuml",
  config = function()
    -- opcional: path al ejecutable
    vim.g.plantuml_executable_script = "plantuml"

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.puml",
      callback = function()
        local file = vim.fn.expand("%:p")

        vim.fn.jobstart(
          { "plantuml", "-checkonly", file },
          {
            stderr_buffered = true,
            on_stderr = function(_, data)
              if not data then return end

              local qf = {}
              for _, line in ipairs(data) do
                local lnum, msg = line:match("line (%d+).-%)%s*(.+)")
                if lnum then
                  table.insert(qf, {
                    filename = file,
                    lnum = tonumber(lnum),
                    text = msg,
                  })
                end
              end

              if #qf > 0 then
                vim.fn.setqflist(qf, "r")
                vim.cmd("copen")
              end
            end,
          }
        )
      end,
    })
  end,
}
