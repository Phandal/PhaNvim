local base16 = require('base16')

if vim.loop.os_uname().sysname == 'Linux' and vim.loop.os_gethostname() == "ArchBox" then
  base16(base16.themes['solarized-light'], true)
else 
  base16(base16.themes['one-light'], true)
end
