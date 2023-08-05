-- Some options need to be set right off the bat
vim.g.mapleader = ','
vim.cmd [[ set autochdir ]]
vim.cmd [[ autocmd BufEnter * silent! :lcd%:p:h ]]
require 'lazyconf'
require 'autocd'
require 'options'
require 'filetypes'
require 'plugin.cmp'
require 'plugin.maps'
require 'plugin.lspconf'
require 'plugin.statusline'
require 'plugin.autopair'
require 'plugin.file-explore'
require 'plugin.nonsetup'
require 'plugin.tabline'
require 'plugin.scroll'
require 'plugin.rust'
require 'plugin.prettier'
require 'plugin.presence'
require 'plugin.notifyconf'
require 'plugin.greeter'
require 'plugin.nordconf'
require 'plugin.telescope'
require 'plugin.navbuddy'
require 'plugin.snippets'
require 'plugin.volartakeovermode'
require 'plugin.navic'
vim.cmd.colorscheme "nord"
