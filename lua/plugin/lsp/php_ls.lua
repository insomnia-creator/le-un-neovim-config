-- https://intelephense.com
require('lspconfig').intelephense.setup {
  on_attach = require('plugin.lsp').on_attach,
  capabilities = require('plugin.lsp').capabilities,
  settings = {
    intelephense = {
      environment = {
        shortOpenTag = true,
      },
    },
  },
}
