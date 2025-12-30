return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Git: LazyGit" },
    { "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "Git: LazyGit (Current File)" },
    { "<leader>gf", "<cmd>LazyGitFilter<cr>", desc = "Git: LazyGit Filter" },
    { "<leader>gF", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "Git: LazyGit Filter (Current File)" },
  },
}
