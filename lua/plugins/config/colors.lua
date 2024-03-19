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
require("gruvbox").setup({
  terminal_colors = true,  -- add neovim terminal colors
  undercurl = false,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,  -- invert background for search, diffs, statuslines and errors
  contrast = "",   -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    LspReferenceRead = { bg = "#3c3836" },
    LspReferenceText = { bg = "#3c3836" },
    LspReferenceWrite = { bg = "#3c3836" },
  },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

-- Github Dark ColorScheme
-- vim.cmd("colorscheme github_dark_dimmed")
