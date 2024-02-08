local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'folke/lazy.nvim',                                         -- Plugin Manager
  'projekt0n/github-nvim-theme',                             -- Github Theme
  'shaunsingh/nord.nvim',                                    -- Nord Theme
  'ellisonleao/gruvbox.nvim',                                -- Gruvbox Lua Theme
  { 'kyazdani42/nvim-tree.lua',                              -- Tree like file manager
        dependencies = { 'kyazdani42/nvim-web-devicons' }    -- Pretty icons in NvimTree
  },
  'hoob3rt/lualine.nvim',                                    -- Different modeline
  'WhoIsSethDaniel/lualine-lsp-progress',                    -- LSP Server Progress in lualine
  { 'nvim-telescope/telescope.nvim',                         -- Fuzzy Finder
        dependencies = { 'nvim-lua/plenary.nvim' }           -- Dependency Plugin
  },
  'lewis6991/gitsigns.nvim',                                 -- Git integration
  { 'nvim-treesitter/nvim-treesitter',                       -- Syntax highlighting using TreeSitter
        run = ':TSUpdate' },
  'nvim-treesitter/playground',                              -- Playground for TreeSitter
  'windwp/nvim-autopairs',                                   -- Automatically adds closing bracket
  'lukas-reineke/indent-blankline.nvim',                     -- Shows a symbol for indents
  'onsails/lspkind.nvim',                                    -- Shows pictograms in completion menu
  'neovim/nvim-lspconfig',                                   -- Base set of LSP configs
  'folke/neodev.nvim',                                       -- Add functionality to lua server
  'hrsh7th/nvim-cmp',                                        -- Completion engine
  'hrsh7th/cmp-nvim-lsp',                                    -- Completion for LSP
  'hrsh7th/cmp-nvim-lsp-signature-help',                     -- Completion Plugin to show signatures
  'saadparwaiz1/cmp_luasnip',                                -- Completion Plugin to show snippets
  'L3MON4D3/LuaSnip',                                        -- Snippet Plugin
  'nanotee/luv-vimdocs',                                     -- libuv docs in Neovim
  { dir =  '~/Development/suitecloud.nvim/main' }            -- Custom Work in progress
})
