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
        requires = { 'kyazdani42/nvim-web-devicons' }           
      })
  use ('hoob3rt/lualine.nvim')                                    -- Different modeline
  use ({ 'nvim-telescope/telescope.nvim',                         -- Fuzzy Finder
        requires = { 'nvim-lua/plenary.nvim' }
      })
  use ({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })  -- Syntax highlighting using TreeSitter
  use ('windwp/nvim-autopairs')                                   -- Automatically adds closing bracket
  use ('lukas-reineke/indent-blankline.nvim')                     -- Shows a symbol for indents
  use ('neovim/nvim-lspconfig')                                   -- Base set of LSP configs
  use ('hrsh7th/nvim-cmp')                                        -- Completion engine
  use ('hrsh7th/cmp-nvim-lsp')                                    -- Completion for LSP
  use ('hrsh7th/cmp-nvim-lsp-signature-help')                     -- Completion Plugin to show signatures
  use ('L3MON4D3/LuaSnip')                                        -- Snippet Plugin
  use ('nanotee/luv-vimdocs')                                     -- libuv docs in Neovim
  use ('saadparwaiz1/cmp_luasnip')                                -- Completion Plugin to show snippets
  -- use ('Phandal/sdfcli.nvim')                                     -- SDF plugin
  use ('~/Development/sdfcli.nvim/')

  -- use ('ms-jpq/lua-async-await')

  if packer_bootstrap then
    require("packer").sync()
  end
end)
