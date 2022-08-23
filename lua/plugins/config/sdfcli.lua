local cmd_location = nil
if vim.loop.os_uname().sysname == 'Darwin' then
  cmd_location = vim.env.HOME .. '.local/bin/sdfcli'
else
  cmd_location = '/sdfcli/sdfcli.bat'
end

-- Setup for the plugin
require('sdfcli-nvim').setup({
  sdfcli_cmd = cmd_location
})
