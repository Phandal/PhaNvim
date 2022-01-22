-- Custom Lua Config
local scopes = { o = vim.o, w = vim.wo, b = vim.bo }
local keys = vim.api.nvim_set_keymap

--- Set options for the editor
-- For each 'option', the 'value' will be set.
-- The function sets the option in current scope
-- and in global scope if not done already.
-- @params scope A string containing the scope
-- @params option A string containing the option to be set
-- @params value A value that the option should be set to
function Opt(scope, option, value)
	scopes[scope][option] = value
	if scope ~= "o" then
		scopes["o"][option] = value
	end
end

-- Setting options
Opt("w", "number", true)                                -- Adds number lines
Opt("b", "syntax", "on")                                -- Turns on syntax highlighting
Opt("b", "tabstop", 2)                                  -- Sets width of tabs
Opt("b", "softtabstop", 2)                              -- Also changes tab width
Opt("b", "shiftwidth", 2)                               -- Sets the how much lines are shifted over
Opt("b", "expandtab", true)                             -- Turns tabs into spaces
Opt("o", "showmode", false)                             -- Turns off mode in the command bar
Opt("o", "mouse", "a")                                  -- Turns on the mouse
Opt("o", "clipboard", "unnamedplus")                    -- Sets the clipboard to the same one as the system
Opt("w", "wrap", false)                                 -- Turns off word wrapping
Opt("o", "splitright", true)                            -- Split to the right
Opt("o", "splitbelow", true)                            -- Split to the bottom
Opt("w", "foldmethod", "marker")                        -- Sets the fold method
Opt("o", "hidden", true)                                -- Instead of unloading buffers just hide them
Opt("o", "backup", false)                               -- Turn off backup files
Opt("o", "writebackup", false)                          -- Stop writing backup
Opt("o", "cmdheight", 2)                                -- Sets the height of the command bar
Opt("o", "updatetime", 300)                             -- Changes the update time (Used for LSP)
Opt("o", "shortmess", "filnxtToOFc")                    -- Change the format of messages
Opt("w", "signcolumn", "yes")                           -- Set the sign column
Opt("o", "termguicolors", true)                         -- Sets the colors properly
Opt("o", "completeopt", "menuone,noselect,preview")     -- Changes the options for when completion should show up
Opt("o", "ignorecase", true)                            -- Ignore case in search

-- Plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'                                  -- Plugin Manager
  use 'norcalli/nvim-base16.lua'                                -- Theme
  use 'neovim/nvim-lspconfig'                                   -- Base set of LSP configs
  use 'hoob3rt/lualine.nvim'                                    -- Different modeline
  use 'hrsh7th/nvim-cmp'                                        -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'                                    -- Completion for LSP
  use 'hrsh7th/cmp-buffer'                                      -- Completion for Buffers
  use 'hrsh7th/cmp-path'                                        -- Completion for Paths
  use 'hrsh7th/cmp-cmdline'                                     -- Completion for the command line
  use 'hrsh7th/cmp-vsnip'                                       -- Completion for vsnip
  use 'hrsh7th/vim-vsnip'                                       -- Snippets plugin
  use 'lukas-reineke/indent-blankline.nvim'                     -- Shows a symbol for indents
  use 'windwp/nvim-autopairs'                                   -- Automatically adds closing bracket
  use 'kyazdani42/nvim-web-devicons'                            -- Cool icons
  use 'kyazdani42/nvim-tree.lua'                                -- Tree like file manager
  use 'folke/lua-dev.nvim'                                      -- Config file for lua
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- Syntax highlighting using TreeSitter
  --use 'nvim-telescope/telescope.nvim'                         -- Fuzzy Finder
  use 'ibhagwan/fzf-lua'                                        -- Fuzzy Finder
  use 'nvim-lua/popup.nvim'                                     -- Dependency Plugin
  use 'nvim-lua/plenary.nvim'                                   -- Dependency Plugin
end)

-- Setting the colorscheme and statusline
local base16 = require 'base16'
base16(base16.themes.onedark, true)
require('lualine').setup{
	options = {
		theme = 'onedark',
		section_separators = "",
		component_separators = ""
	},
  extenstions = {'nvim-tree'}
}

-- Keybinds
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
keys("i", "jk", "<ESC>", opts)
keys("n", "<f5>", [[<CMD>! debug/test<CR>]], {noremap = true})
keys("n", "<leader>m", [[<CMD>make<CR>]], opts)
keys("n", "<F6>", [[<CMD>e $MYVIMRC<CR>]], opts)
keys("n", "<F7>", [[<CMD>luafile $MYVIMRC<CR>]], opts)
keys("n", "<leader>t", [[<CMD>10sp<CR><CMD>term<CR>]], opts)
keys("t", "<ESC>", [[<C-\><C-N>]], opts)
keys("i", "<C-SPACE>", [[<C-X><C-O>]], opts)
keys("n", "<C-n>", [[<CMD>NvimTreeToggle<CR>]], opts)
keys("n", "gt", [[<CMD>tabnext<CR>]], opts)
keys("n", "gT", [[<CMD>tabprevious<CR>]], opts)

-- Autocommands *This is the best way of doing it right now*
vim.api.nvim_command([[autocmd TermOpen * setlocal nonu]])
vim.api.nvim_command([[autocmd TermOpen * startinsert]])
vim.api.nvim_command([[autocmd BufWinEnter agenda.md silent! loadview]])
vim.api.nvim_command([[autocmd BufWinEnter agenda.md setlocal nonu]])
vim.api.nvim_command([[autocmd BufWinEnter agenda.md setlocal signcolumn=no]])
vim.api.nvim_command([[autocmd BufWinLeave agenda.md mkview]])

-- Neovide Configuration
vim.g.neovide_cursor_vfx_mode = "pixiedust"
--Opt("o", "guifont", "NotoMono NF,all-the-icons")

-- CMP setup
local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Vsnip setup
keys("i", "<Tab>", [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']], {expr = true})
keys("i", "<S-Tab>", [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], {expr = true})
keys("s", "<Tab>", [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']], {expr = true})
keys("s", "<S-Tab>", [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], {expr = true})

-- Lsp Config
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "cmake", "gopls", "bashls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end

-- My Rust-tools setup
--require('rust-tools').setup()

-- My ccls setup
nvim_lsp.ccls.setup {
  init_options = {
    compilationDatabaseDirectory = "build";
  },
  on_attach = on_attach,
  capabilities = capabilities
}

-- My luadev setup
-- set the path to the sumneko installation
local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = '/home/bailey/.config/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local luadev = require('lua-dev').setup({
  lspconfig = {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    -- An example of settings for an LSP server.
    --    For more options, see nvim-lspconfig
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';'),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      }
    },
    on_attach = on_attach,
    capabilities = capabilities
  }
})
--local lspconfig = require('lspconfig')
nvim_lsp.sumneko_lua.setup(luadev)

-- Custom Highlights
--vim.highlight.create('LineNr', {guibg='#2E3440'}, false)
--vim.highlight.create('SignColumn', {guibg='#2E3440'}, false)


-- Devicons setup
require 'nvim-web-devicons'.setup{default = true;}

-- Autopairs setup
require('nvim-autopairs').setup()

-- IndentLine setup
vim.g.indent_blankline_filetype_exclude = {"help", "terminal"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}
vim.g.indent_blankline_char = "┊"

-- TreeSitter setup
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
};

-- NvimTree setup
require 'nvim-tree'.setup()

require('fzf-lua').setup{
  winopts = {
    preview = {
      hidden = 'hidden'
    }
  }
}

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('fzf-lua').live_grep()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('fzf-lua').help_tags()<CR>", {silent = true, noremap = true})
