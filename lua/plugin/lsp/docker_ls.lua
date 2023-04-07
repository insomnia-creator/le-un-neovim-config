-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
require('lspconfig').dockerls.setup {
  on_attach = require('plugin.lsp').on_attach,
  capabilities = require('plugin.lsp').capabilities,
}
