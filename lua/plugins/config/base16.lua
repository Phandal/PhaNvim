local os = vim.loop.os_uname().sysname
local base16 = require('base16')

if os == 'Linux' then
  base16(base16.themes['solarized-light'], true)
else 
  base16(base16.themes['onedark'], true)
end
