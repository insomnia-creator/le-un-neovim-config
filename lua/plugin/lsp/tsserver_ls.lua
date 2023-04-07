-- https://github.com/theia-ide/typescript-language-server
local is_npm_package_installed = require'npm'

local have_vue = is_npm_package_installed 'vue'

if not have_vue then
  require('typescript').setup {
    server = {
      on_attach = require('plugin.lsp').on_attach,
      capabilities = require('plugin.lsp').capabilities,
    },
  }
end
