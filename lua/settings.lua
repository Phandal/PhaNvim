local g = vim.g
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd

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
opt.laststatus = 3
opt.fillchars = "eob: ,vert:│"
opt.cursorline = true
opt.list = true
opt.listchars = opt.listchars + 'eol:﬋, trail:∙'
opt.relativenumber = true

-- Global variables
g.mapleader = " "

-- Autocommands
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.number = false" })
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.relativenumber = false" })
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.signcolumn = 'no'" })
autocmd("TermOpen", { pattern = "*", command = "startinsert" })
autocmd("FileType", { pattern = "help", command = "nnoremap q <CMD>bd!<CR>" })
autocmd("FileType", { pattern = "qf", command = "nnoremap q <CMD>bd!<CR>" })
autocmd("BufWritePre", { pattern = "*.tsx,*.ts,*.jsx,*.js", command = "EslintFixAll" })

-- Highlights
cmd([[hi SignColumn guibg=none ctermbg=none]])
cmd([[hi StatusLineNC guibg=none]])
cmd([[hi StatusLine guibg=none]])
cmd([[hi VertSplit guibg=none]])
cmd([[hi LineNr guibg=none]])
cmd([[hi! link NvimTreeNormal lualine_c_normal]])
cmd([[hi! link LspReferenceText Search]])
cmd([[hi! link LspReferenceRead Search]])
cmd([[hi! link LspReferenceWrite Search]])
