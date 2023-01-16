local fn = vim.fn
local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(packer_install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		packer_install_path,
	})
end

require('packer').startup(function(use)
  use ('wbthomason/packer.nvim')                                  -- Plugin Manager
  use ('norcalli/nvim-base16.lua')                                -- Theme
  use ({ 'kyazdani42/nvim-tree.lua',                              -- Tree like file manager
        requires = { 'kyazdani42/nvim-web-devicons' }             -- Pretty icons in NvimTree
      })
  use ('hoob3rt/lualine.nvim')                                    -- Different modeline
  -- use ({ 'akinsho/bufferline.nvim',                               -- Better bufferline
  --       tag = "v3.*",
  --       requires = { 'nvim-tree/nvim-web-devicons'}               -- Pretty icons in NvimTree
  --     })
  use ('WhoIsSethDaniel/lualine-lsp-progress')                    -- LSP Server Progress in lualine
  use ({ 'nvim-telescope/telescope.nvim',                         -- Fuzzy Finder
        requires = { 'nvim-lua/plenary.nvim' }                    -- Dependency Plugin
      })
  use ('lewis6991/gitsigns.nvim')                                 -- Git integration
  use ({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })  -- Syntax highlighting using TreeSitter
  use ('windwp/nvim-autopairs')                                   -- Automatically adds closing bracket
  use ('lukas-reineke/indent-blankline.nvim')                     -- Shows a symbol for indents
  use ('onsails/lspkind.nvim')                                    -- Shows pictograms in completion menu
  use ('folke/todo-comments.nvim')                                -- Highlights TODO and other comments
  use ('neovim/nvim-lspconfig')                                   -- Base set of LSP configs
  use ('folke/neodev.nvim')                                       -- Add functionality to lua server
  use ('hrsh7th/nvim-cmp')                                        -- Completion engine
  use ('hrsh7th/cmp-nvim-lsp')                                    -- Completion for LSP
  use ('hrsh7th/cmp-nvim-lsp-signature-help')                     -- Completion Plugin to show signatures
  use ('saadparwaiz1/cmp_luasnip')                                -- Completion Plugin to show snippets
  use ('L3MON4D3/LuaSnip')                                        -- Snippet Plugin
  use ('nanotee/luv-vimdocs')                                     -- libuv docs in Neovim
  use ('~/Development/sdfcli-nvim/')                              -- SDF Plugin

  if packer_bootstrap then
    require("packer").sync()
  end
end)
