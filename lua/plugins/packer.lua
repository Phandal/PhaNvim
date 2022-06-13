require('packer').startup(function()
  use 'wbthomason/packer.nvim'                                  -- Plugin Manager
  use 'norcalli/nvim-base16.lua'                                -- Theme
  use { 'kyazdani42/nvim-tree.lua',                             -- Tree like file manager
        requires = { 'kyazdani42/nvim-web-devicons' }           
      }
  use 'hoob3rt/lualine.nvim'                                    -- Different modeline
  use { 'nvim-telescope/telescope.nvim',                          -- Fuzzy Finder
        requires = { 'nvim-lua/plenary.nvim' }
      }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- Syntax highlighting using TreeSitter
  use 'windwp/nvim-autopairs'                                   -- Automatically adds closing bracket
  use 'lukas-reineke/indent-blankline.nvim'                     -- Shows a symbol for indents
  use 'neovim/nvim-lspconfig'                                   -- Base set of LSP configs

  -- use 'hrsh7th/nvim-cmp'                                        -- Completion engine
  -- use 'hrsh7th/cmp-nvim-lsp'                                    -- Completion for LSP
  -- use 'hrsh7th/cmp-buffer'                                      -- Completion for Buffers
  -- use 'hrsh7th/cmp-path'                                        -- Completion for Paths
  -- use 'hrsh7th/cmp-cmdline'                                     -- Completion for the command line
  -- use 'hrsh7th/cmp-vsnip'                                       -- Completion for vsnip
  -- use 'hrsh7th/vim-vsnip'                                       -- Snippets plugin
  -- use 'nvim-lua/popup.nvim'                                     -- Dependency Plugin
  -- use 'nvim-lua/plenary.nvim'                                   -- Dependency Plugin
end)
