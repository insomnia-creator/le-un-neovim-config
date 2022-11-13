vim.opt.termguicolors = true
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
require('notify').setup {
  background_colour = macchiato.surface0
}

vim.notify = require 'notify'

local notify = vim.notify
vim.notify = function(msg, ...)
  if type(msg) == 'string' then
    local is_suppressed_message = msg:match '%[lspconfig] Autostart for' or msg:match 'No information available' or msg:match 'Client'
    if is_suppressed_message then
      -- Do not show some messages
      return
    end
  end

  notify(msg, ...)
end
