vim.cmd [[
    autocmd!
    autocmd VimEnter * cd $PWD
]]

require 'packerconf'
require 'filetypes'
require 'plugin.cmp'
require 'plugin.maps'
require 'plugin.lspconf'
require 'plugin.statusline'
require 'plugin.autopair'
require 'plugin.file-explore'
require 'catppuccin'.setup {
    flavour = "macchiato"
}
require 'plugin.telescope'
require 'plugin.notifyconf'
require 'options'
vim.cmd.colorscheme "catppuccin"