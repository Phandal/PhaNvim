local g = vim.g
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

-- Options
opt.syntax = "on"
opt.number = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.showmode = false
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.shortmess = "filnxtToOFc"
opt.signcolumn = "yes"
opt.termguicolors = true
opt.ignorecase = true
opt.completeopt = "menuone,noselect,preview"
opt.background = "light"

-- Global variables
g.mapleader = " "

-- Autocommands
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.number = false"})
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.signcolumn = 'no'"})
autocmd("TermOpen", { pattern = "*", command = "startinsert"})
