local cmd_location = nil
local sysname = vim.loop.os_uname().sysname
if sysname == 'Darwin' or sysname == 'Linux' then
  cmd_location = vim.env.HOME .. '/.local/bin/sdfcli'
else
  cmd_location = '/sdfcli/sdfcli.bat'
end

-- Setup for the plugin (Still under development)
require('sdfcli-nvim').setup({
  sdfcli_cmd_path = cmd_location,
  sdfcli_cmd = cmd_location,
})
