local colours = require'nord.colors'
require('notify').setup {
  background_colour = colours.nord1_gui
}

vim.notify = require 'notify'

local notify = vim.notify
vim.notify = function(msg, ...)
  if type(msg) == 'string' then
    local is_suppressed_message = msg:match '%[lspconfig] Autostart for' or msg:match 'No information available' or msg:match 'Client' or msg:match 'warning: multiple different client offset_encodings detected for buffer, this is not supported yet'

    if is_suppressed_message then
      -- Do not show some messages
      return
    end
  end

  notify(msg, ...)
end
