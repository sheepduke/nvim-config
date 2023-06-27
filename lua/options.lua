local o = vim.opt
local wo = vim.wo
local g = vim.g

-- Disable netrw.
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set leading key.
g.mapleader = " "

o.expandtab = true -- Use spaces as tabs.
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

o.wildmode = "longest,full"

-- Set termguicolors to enable highlight groups.
o.termguicolors = true

-- Show line number.
wo.number = true
wo.relativenumber = true

-- Display cursor line.
o.cursorline = true
