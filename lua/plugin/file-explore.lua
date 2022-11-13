require 'drex'
require 'drex.config'.configure {
    hijack_netrw = true,
}

vim.keymap.set('n', 'f', function()
    require('drex').open_directory_buffer() -- open at cwd
end)