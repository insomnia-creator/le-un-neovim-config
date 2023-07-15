require 'trouble'.setup {}
require 'mason'.setup {}
require 'mason-null-ls'.setup {}
require 'project_nvim'.setup {}
require 'flutter-tools'.setup {
  widget_guides = {
    enabled = true;
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
}
require 'Comment'.setup {}
-- require 'shade'.setup({
--     overlay_opacity = 50,
--     keys = {
--         brightness_up    = '<C-S-Down>',
--         brightness_down  = '<C-S-Up>',
--         toggle           = '<Leader>sh',
--       }
-- })
require'web-tools'.setup {}
require 'nvim-web-devicons'.setup {
    default = true
}

require 'codicons'.setup {

}
require 'fidget'.setup {
  window = { blend = 0}
}
require('nvim-highlight-colors').setup {
  enable_tailwind = true
}

require('gitsigns').setup();
