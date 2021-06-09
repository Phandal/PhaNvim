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
Opt("w", "number", true)
Opt("b", "syntax", "on")
Opt("b", "tabstop", 2)
Opt("b", "softtabstop", 2)
Opt("b", "shiftwidth", 2)
Opt("b", "expandtab", true)
Opt("o", "showmode", false)
Opt("o", "mouse", "a")
Opt("o", "clipboard", "unnamedplus")
Opt("w", "wrap", false)
Opt("o", "splitright", true)
Opt("o", "splitbelow", true)
Opt("w", "foldmethod", "marker")
Opt("o", "hidden", true)
Opt("o", "backup", false)
Opt("o", "writebackup", false)
Opt("o", "cmdheight", 2)
Opt("o", "updatetime", 300)
Opt("o", "shortmess", "filnxtToOFc")
Opt("w", "signcolumn", "yes")
Opt("o", "termguicolors", true)
Opt("o", "completeopt", "menuone,noselect,preview")
Opt("o", "ignorecase", true)

-- Setting the colorscheme and statusline
local base16 = require 'base16'
base16(base16.themes.onedark, true)
require('lualine').setup{
	options = {
		theme = 'onedark',
		section_separators = "",
		component_separators = ""
	}
}

-- File explorer settings
vim.g.netrw_winsize = 20
vim.g.netrw_menu = 0
vim.g.netrw_banner = 0

-- Keybinds
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
keys("i", "jk", "<ESC>", opts)
keys("n", "<F6>", [[<CMD>e ~/Appdata/Local/nvim/init.lua<CR>]], opts)
keys("n", "<F7>", [[<CMD>luafile ~/Appdata/Local/nvim/init.lua<CR>]], opts)
keys("n", "<F9>", [[<CMD>e ~/agenda.md<CR>]], opts)
keys("n", "<leader>t", [[<CMD>10sp<CR><CMD>term<CR>]], opts)
keys("t", "<ESC>", [[<C-\><C-N>]], opts)
keys("i", "<C-SPACE>", [[<C-X><C-O>]], opts)
keys("n", "<C-n>", [[<CMD>Lexplore<CR>]], opts)
keys("n", "gt", [[<CMD>tabnext<CR>]], opts)
keys("n", "gT", [[<CMD>tabprevious<CR>]], opts)

-- Autocommands *This is the best way of doing it right now*
vim.api.nvim_command([[autocmd TermOpen * setlocal nonu]])
vim.api.nvim_command([[autocmd TermOpen * startinsert]])
vim.api.nvim_command([[autocmd BufWinEnter agenda.md silent! loadview]])
vim.api.nvim_command([[autocmd BufWinEnter agenda.md setlocal nonu]])
vim.api.nvim_command([[autocmd BufWinEnter agenda.md setlocal signcolumn=no]])
vim.api.nvim_command([[autocmd BufWinLeave agenda.md mkview]])

-- My Custom AgendaView function
function AgendaView()
	local buf = vim.api.nvim_create_buf(false, false)
	local ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * .7)
	local height = math.floor(ui.height * .7)
	local options = {
		relative = 'editor',
		width = width,
		height = height,
		col = (ui.width / 2) - (width / 2),
		row = ((ui.height / 2) - 2) - (height / 2),
		anchor = 'NW',
		border = 'shadow',
		style = 'minimal'
	}
	vim.api.nvim_open_win(buf, true, options)
	vim.api.nvim_set_current_buf(buf)
	vim.api.nvim_command("e ~/agenda.md")
end
keys("n", "<F8>", [[<CMD>lua AgendaView()<CR>]], opts)


-- Plugins
require 'paq-nvim' {
	'savq/paq-nvim';

	'norcalli/nvim-base16.lua';
	'neovim/nvim-lspconfig';
	'hoob3rt/lualine.nvim';
  'hrsh7th/nvim-compe';
  {'lukas-reineke/indent-blankline.nvim', branch='lua'};
  'windwp/nvim-autopairs';
  'kyazdani42/nvim-web-devicons';
  'folke/lua-dev.nvim';
  {'nvim-treesitter/nvim-treesitter', run='TSUpdate'};
}


-- Neovide Configuration
vim.g.neovide_cursor_vfx_mode = "pixiedust"
Opt("o", "guifont", "NotoMono NF,all-the-icons")

-- Lsp Config
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

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
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- My luadev setup
-- set the path to the sumneko installation
local system_name = "Windows" -- (Linux, macOS, or Windows)
local sumneko_root_path = '/Tools/lua-language-server'
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
    on_attach = on_attach
  }
})
local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup(luadev)

-- Custom Highlights
vim.highlight.create('LineNr', {guibg='#282c34'}, false)
vim.highlight.create('SignColumn', {guibg='#282c34'}, false)


-- Compe Setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})

-- Devicons setup
require 'nvim-web-devicons'.setup{default = true;}

-- Autopairs setup
require('nvim-autopairs').setup()

-- IndentLine setup
vim.g.indent_blankline_filetype_exclude = {"help", "terminal"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}
vim.g.indent_blankline_char = "⋮"

-- TreeSitter setup
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      ["foo.bar"] = "Identifier",
    },
  }
};
