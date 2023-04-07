require('lspconfig').clangd.setup {
  on_attach = require('plugin.lsp').on_attach,
  capabilities = require('plugin.lsp').capabilities,
}
