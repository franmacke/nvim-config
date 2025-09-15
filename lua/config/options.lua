-- Opciones generales de Neovim

local opt = vim.opt

-- Líneas
opt.number = true
opt.relativenumber = true

-- Tabs & espacios
opt.tabstop = 2        -- número de espacios que representa un <Tab>
opt.shiftwidth = 2     -- número de espacios al usar indentación automática
opt.expandtab = true   -- convierte tabs en espacios
opt.smartindent = true -- indentación inteligente

-- Búsqueda
opt.ignorecase = true -- búsqueda case-insensitive
opt.smartcase = true  -- sensible a mayúsculas si usás letras grandes

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- Comodidad
opt.clipboard = "unnamedplus" -- usa clipboard del sistema
opt.scrolloff = 8             -- margen vertical al hacer scroll
opt.splitright = true         -- splits a la derecha
opt.splitbelow = true         -- splits abajo
