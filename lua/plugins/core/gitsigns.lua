return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = {
        text = "│",
        texthl = "GitSignsAdd",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        text = "│",
        texthl = "GitSignsChange",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        text = "_",
        texthl = "GitSignsDelete",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        text = "‾",
        texthl = "GitSignsDelete",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        text = "~",
        texthl = "GitSignsChange",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      untracked = {
        text = "┆",
        texthl = "GitSignsAdd",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    diff_opts = {
      internal = true,
    },
    word_diff = true,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      virt_text_delay = 200,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc, buffer)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- Toggle blame buffer: close if open, otherwise open
      local function toggle_blame_buffer()
        local blame_win = nil
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "gitsigns-blame" then
            blame_win = win
            break
          end
        end
        if blame_win then
          vim.api.nvim_win_close(blame_win, false)
        else
          gs.blame()
        end
      end

      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, "Git: Next hunk")

      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, "Git: Previous hunk")

      map({ "n", "x" }, "<leader>ghs", gs.stage_hunk, "Git: Stage hunk")
      map({ "n", "x" }, "<leader>ghr", gs.reset_hunk, "Git: Reset hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Git: Stage buffer")
      map("n", "<leader>ghR", gs.reset_buffer, "Git: Reset buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Git: Preview hunk")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Git: Blame line (full)")
      map("n", "<leader>ghd", gs.diffthis, "Git: Diff this")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Git: Diff ~")
      map("n", "<leader>ght", toggle_blame_buffer, "Git: Toggle blame buffer")

      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git: Text object hunk")
    end,
  },
}
