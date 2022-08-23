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
opt.fillchars = "eob: ,vert:|"
-- Windows specific Terminal settings to use PowerSHell
-- if vim.loop.os_uname().sysname == 'Windows_NT' then
--   opt.shell = 'pwsh'
--   opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
--   opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--   opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
--   opt.shellquote= 'shellxquote='
-- end

-- Global variables
g.mapleader = " "

-- Autocommands
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.number = false" })
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.signcolumn = 'no'" })
autocmd("TermOpen", { pattern = "*", command = "startinsert" })
autocmd("BufWritePre", { pattern = "*.tsx,*.ts,*.jsx,*.js", command = "EslintFixAll" })

-- Highlights
cmd([[hi SignColumn guibg=none ctermbg=none]])
cmd([[hi StatusLineNC guibg=none]])
cmd([[hi StatusLine guibg=none]])
cmd([[hi VertSplit guibg=none]])
cmd([[hi LineNr guibg=none]])
-- OneDark Highlight cmd([[hi NvimTreeNormal guibg=#20242c]])
cmd([[hi NvimTreeNormal guibg=#f2f2f2]])

