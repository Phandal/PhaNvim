local theme
if vim.loop.os_uname().sysname == "Linux" and vim.loop.os_gethostname() == "ArchBox" then
  theme = 'solarized_light'
else
  theme = 'onedark'
end

local get_current_time = function()
  return os.date('%X'):sub(0,5).. ' '
end

local get_sdfcli_env = function()
  local env = require('sdfcli-nvim.config').opts.environment_name
  if env ~= nil then
    return env
  end
  return ''
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = '|',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'lsp_progress'},
    lualine_x = {get_current_time, get_sdfcli_env, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree', 'quickfix'}
}
