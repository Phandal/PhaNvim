local g = vim.g
local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

-- Options
opt.autowrite = true
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
opt.updatetime = 300
opt.shortmess = "filnxtToOFc"
opt.signcolumn = "yes"
opt.termguicolors = true
opt.ignorecase = true
opt.completeopt = "menuone,noselect,noinsert,preview"
opt.background = "dark"
opt.laststatus = 3
opt.fillchars = { eob = " ", vert = "│" }
opt.cursorline = false
opt.list = true
-- opt.listchars = opt.listchars + 'eol:󱞥, trail:·, tab:  '
opt.listchars = opt.listchars + 'trail:·, tab:  '
opt.relativenumber = true
opt.guicursor =
"n-v-c-sm:block-blinkwait300-blinkon200-blinkoff150,i-ci-ve:ver25-blinkwait300-blinkon200-blinkoff150,r-cr-o:hor20"
opt.shiftround = true
opt.smartcase = true
opt.grepprg = "rg --vimgrep"
opt.path = opt.path + "**"
opt.wildmenu = true
opt.wildignorecase = true

-- Global variables
g.mapleader = " "

-- Autocommands
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.number = false" })
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.relativenumber = false" })
autocmd("TermOpen", { pattern = "*", command = "lua vim.opt.signcolumn = 'no'" })
autocmd("TermOpen", { pattern = "*", command = "startinsert" })

-- Custom Commands
usercmd('Deploy', '!suitecloud project:deploy', {})
usercmd('Preview', '!suitecloud project:deploy --dryrun', {})
