-- =============================================================================
-- Keymaps Registry
-- =============================================================================
-- Este archivo define la estructura semántica de los keymaps.
-- NO registra keymaps de plugins (eso lo hace cada plugin en su propio momento).
-- Define la TAXONOMÍA y CATEGORÍAS de toda la configuración.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Leader Keys
-- -----------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -----------------------------------------------------------------------------
-- Registry de Categorías
-- -----------------------------------------------------------------------------
-- Cada categoría define:
-- - prefix: El prefijo de keymap (ej: "<leader>f")
-- - name: Nombre descriptivo para which-key
-- - desc: Descripción del propósito de la categoría
-- -----------------------------------------------------------------------------

local M = {}

M.categories = {
  files = {
    prefix = "<leader>f",
    name = "Files",
    desc = "File operations and fuzzy search",
  },
  git = {
    prefix = "<leader>g",
    name = "Git",
    desc = "Git operations",
  },
  project = {
    prefix = "<leader>p",
    name = "Project",
    desc = "Project management (Harpoon)",
  },
  debug = {
    prefix = "<leader>d",
    name = "Debug",
    desc = "Debugger controls",
  },
  ai = {
    prefix = "<leader>o",
    name = "OpenCode AI",
    desc = "AI coding assistant",
  },
  code = {
    prefix = "<leader>c",
    name = "Code",
    desc = "LSP code actions and refactoring",
  },
  tools = {
    prefix = "<leader>t",
    name = "Tools",
    desc = "Developer tools",
  },
  workspace = {
    prefix = "<leader>w",
    name = "Workspace",
    desc = "Buffer and window operations",
  },
  django = {
    prefix = "<leader>j",
    name = "Django",
    desc = "Django framework commands",
  },
  venv = {
    prefix = "<leader>v",
    name = "Venv",
    desc = "Virtual environment selector",
  },
}

-- -----------------------------------------------------------------------------
-- Keymaps Globales (sin dependencias de plugins)
-- -----------------------------------------------------------------------------
-- Estos keymaps se registran aquí porque no dependen de plugins externos
-- -----------------------------------------------------------------------------

-- Oil - File Explorer (Backspace)
vim.keymap.set("n", "<BS>", "<CMD>Oil<CR>", { desc = "Abrir Oil en el directorio padre" })

-- Venv Selector
vim.keymap.set("n", "<leader>v", "<CMD>:VenvSelect<CR>", { desc = "Abrir entorno virtual" })

return M
