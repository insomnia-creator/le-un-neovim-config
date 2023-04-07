require ('lspconfing').dartls.setup {
  on_attach = require('plugin.lsp').on_attach,
  capabilities = require('plugin.lsp').capabilities
}
