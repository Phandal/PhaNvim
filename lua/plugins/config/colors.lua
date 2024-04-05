-- Nord ColorScheme
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = false
-- vim.g.nord_cursorline_transparent = false
-- vim.g.nord_enable_sidebar_background = true
-- vim.g.nord_italic = true
-- vim.g.nord_uniform_diff_background = false
-- vim.g.nord_bold = true
-- require('nord').set()

-- Gruvbox ColorScheme
-- require("gruvbox").setup({
--   terminal_colors = true,  -- add neovim terminal colors
--   undercurl = false,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = true,
--     emphasis = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true,  -- invert background for search, diffs, statuslines and errors
--   contrast = "",   -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {
--     LspReferenceRead = { bg = "#3c3836" },
--     LspReferenceText = { bg = "#3c3836" },
--     LspReferenceWrite = { bg = "#3c3836" },
--   },
--   dim_inactive = false,
--   transparent_mode = false,
-- })
-- vim.cmd("colorscheme gruvbox")

-- Github Dark High Contranst ColorScheme
require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true,         -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true,         -- Override the underline style for non-active statuslines
    transparent = false,               -- Disable setting background
    terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,              -- Non focused panes set to alternative background
    module_default = true,             -- Default enable value for modules
    styles = {                         -- Style to be applied to different syntax groups
      comments = 'italic',             -- Value is any valid attr-list value `:help attr-list`
      functions = 'NONE',
      keywords = 'NONE',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = { -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = { -- Darken floating windows and sidebar-like windows
      floats = false,
      sidebars = {
        enabled = true,
        list = {}, -- Apply dark background to specific windows
      },
    },
    modules = { -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})
vim.cmd("colorscheme github_dark_default")
