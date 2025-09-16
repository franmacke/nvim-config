-- Keymaps generales
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Atajos generales

-- Oil
vim.keymap.set("n", "<BS>", "<CMD>Oil<CR>", { desc = "Abrir Oil en el directorio padre" })

-- Venv Selector
vim.keymap.set("n", "<leader>v", "<CMD>:VenvSelect<CR>", { desc = "Abrir entorno virtual" })


